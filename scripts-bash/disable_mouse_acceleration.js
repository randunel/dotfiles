#!/usr/local/bin/node
'use strict';

const spawn = require('child_process').spawn;

return exec('xinput')
    .then(lines => {
        const id = (lines.match(/\s+mouse\s+id=(\d+)\s+/i)[1]);
        spawn('xinput', ['set-prop', id, 'Device Accel Profile', '-1']);
        spawn('xinput', ['set-prop', id, 'Device Accel Velocity Scaling', '1']);
    });





function exec(cmd, options) {
    return new Promise((resolve, reject) => {
        let bin = cmd.split(' ').shift();
        let params = cmd.split(' ').slice(1);
        let child = spawn(bin, params, options);
        let res = new Buffer(0);
        let err = new Buffer(0);

        child.stdout.on('data', buf => res = Buffer.concat([res, buf], res.length + buf.length));
        child.stderr.on('data', buf => err = Buffer.concat([err, buf], err.length + buf.length));
        child.on('close', code => {
            return setImmediate(() => {
                // console.log(cmd, err.toString(), res.toString());
                // setImmediate is required because there are often still
                // pending write requests in both stdout and stderr at this point
                if (code) {
                    reject(err.toString());
                } else {
                    resolve(res.toString());
                }
            });
        });
        child.on('error', reject);
    });
}

