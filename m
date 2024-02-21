Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A33885CFA8
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 06:31:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE291C6B460;
	Wed, 21 Feb 2024 05:31:14 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD648C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 05:31:13 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso732604866b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 21:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708493473; x=1709098273;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ee8UGbAfInlRw0mmY32iabqom41XT4N0g5e35WXpWiI=;
 b=tvyAKOYzOMEutNKpT9cLmWq27ZPhVH3ujST66zY5qrQCiDh1qQDrOtHCZUIoEseRXs
 lkBXLGtzNYCZYINEW+5HoWntrDKcL9pmyVQbNup/zru33xd0g1sLyD+t7VT1E49LFA+n
 1BJWkdUYrCMzcCYNsIRymdTupM0ZmUb4N8EqofpNn4hVq/jOEvTXF1ccFg99G7tYnAb6
 7qEAMygyhKhotw6OAvk3YoAgH0M9mqqhlgp0b7tQ8hlK6WyYsyE609iHuj2thxK0mSkt
 eycRfYJwWK1yIZvm/bBk2xxelDOo5VJZxcMHLoY8CCT2RROb6C1WnXgfi5QGbE7jfMVL
 ot4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708493473; x=1709098273;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ee8UGbAfInlRw0mmY32iabqom41XT4N0g5e35WXpWiI=;
 b=KHP25ncpqhl43QmDD9o3v9vJXrH8Foz7HNrsSc+jDLJrqn6a3GWXqorFXC0MeEtG/9
 xEhhFL21i+9DIVq1HVD8dGm2xC8D54D0xhNUEwk/Y8CiBASvgGSWy8XlS2dGR6XOB4v2
 0ps40pjnTaEkfWO9zJxU2RjCMt6sFtM4pIfK3ezYqTwfp7kWPKenFanmoqweIG605iT8
 nZu+8IL3krUzFlVumaeQ9A0mVxFyfKo3iwjsxQKKdTzfFe2YmB7XxoJG25dm0r4WKuK1
 rmW7nx6Aqoymu96XYJs+xESlmxDC6VxsR/i6BdcmzFO8+d08HMw9/vSAdCE0LJKFgu2h
 KAtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUugTn0GCnOuxqK3qTIKnG6p9mmxkRs1HqqSJaWnahuFrjv4h7Z99okkIjNyvwOKemxbOM2bxWWTT2Er70F+iSv7b7NU+kM8AE0/6rK9PWFgIKgGQyYe+gB
X-Gm-Message-State: AOJu0YxiAR2bUcItEjSkNEi95Rm1gj8rFkkHdLMswwEQ3LE97l1h7YmP
 5ViqrTo7ZrUAnVtJhfIbEvOdHpRfA6Mp3TRPqL7MgT2AZJz3CLurqSd5EDik5bo=
X-Google-Smtp-Source: AGHT+IEq1eFtTNdd/bmaa3GnlDQllZezHXuoSDlWDXRfmFI1MDpUwA5PpLIhedjCVEADYrw9jNbQjg==
X-Received: by 2002:a17:906:b18e:b0:a3e:8972:4404 with SMTP id
 w14-20020a170906b18e00b00a3e89724404mr4985261ejy.9.1708493473094; 
 Tue, 20 Feb 2024 21:31:13 -0800 (PST)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ov28-20020a170906fc1c00b00a3cf9b832eesm4587301ejb.40.2024.02.20.21.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 21:31:12 -0800 (PST)
Date: Wed, 21 Feb 2024 08:31:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Menglong Dong <dongmenglong.8@bytedance.com>,
 andrii@kernel.org
Message-ID: <d0607bff-b589-4548-98e1-a94d227b4e93@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220035105.34626-3-dongmenglong.8@bytedance.com>
Cc: linux-kselftest@vger.kernel.org, davemarchevsky@fb.com, song@kernel.org,
 sdf@google.com, yonghong.song@linux.dev, thinker.li@gmail.com,
 shuah@kernel.org, linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com,
 dongmenglong.8@bytedance.com, lkp@intel.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, zhoufeng.zf@bytedance.com, mcoquelin.stm32@gmail.com,
 ast@kernel.org, dxu@dxuuu.xyz, oe-kbuild-all@lists.linux.dev,
 kpsingh@kernel.org, linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, eddyz87@gmail.com, jolsa@kernel.org,
 bpf@vger.kernel.org, martin.lau@linux.dev
Subject: Re: [Linux-stm32] [PATCH bpf-next 2/5] bpf: tracing: support to
 attach program to multi hooks
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Menglong,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/bpf-tr=
acing-add-support-to-record-and-check-the-accessed-args/20240220-115317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
patch link:    https://lore.kernel.org/r/20240220035105.34626-3-dongmenglon=
g.8%40bytedance.com
patch subject: [PATCH bpf-next 2/5] bpf: tracing: support to attach program=
 to multi hooks
config: m68k-randconfig-r071-20240220 (https://download.01.org/0day-ci/arch=
ive/20240221/202402210534.siGKEfus-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402210534.siGKEfus-lkp@intel.com/

smatch warnings:
kernel/bpf/syscall.c:3325 bpf_tracing_prog_attach() warn: passing zero to '=
PTR_ERR'
kernel/bpf/syscall.c:3485 bpf_tracing_prog_attach() error: uninitialized sy=
mbol 'link'.

vim +/PTR_ERR +3325 kernel/bpf/syscall.c

4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3255  static int bpf_=
tracing_prog_attach(struct bpf_prog *prog,
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3256  				   int tgt_=
prog_fd,
2fcc82411e74e5 Kui-Feng Lee           2022-05-10  3257  				   u32 btf_id,
2fcc82411e74e5 Kui-Feng Lee           2022-05-10  3258  				   u64 bpf_cook=
ie)
fec56f5890d93f Alexei Starovoitov     2019-11-14  3259  {
a3b80e1078943d Andrii Nakryiko        2020-04-28  3260  	struct bpf_link_pr=
imer link_primer;
3aac1ead5eb6b7 Toke H=F8iland-J=F8rgensen 2020-09-29  3261  	struct bpf_pro=
g *tgt_prog =3D NULL;
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3262  	struct bpf_tra=
mpoline *tr =3D NULL;
5f80eb32851d7a Menglong Dong          2024-02-20  3263  	struct btf *attach=
_btf =3D NULL;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3264  	struct bpf_tracing=
_link *link;
5f80eb32851d7a Menglong Dong          2024-02-20  3265  	struct module *mod=
 =3D NULL;
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3266  	u64 key =3D 0;
a3b80e1078943d Andrii Nakryiko        2020-04-28  3267  	int err;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3268  =

9e4e01dfd3254c KP Singh               2020-03-29  3269  	switch (prog->type=
) {
9e4e01dfd3254c KP Singh               2020-03-29  3270  	case BPF_PROG_TYPE=
_TRACING:
fec56f5890d93f Alexei Starovoitov     2019-11-14  3271  		if (prog->expecte=
d_attach_type !=3D BPF_TRACE_FENTRY &&
be8704ff07d237 Alexei Starovoitov     2020-01-20  3272  		    prog->expecte=
d_attach_type !=3D BPF_TRACE_FEXIT &&
9e4e01dfd3254c KP Singh               2020-03-29  3273  		    prog->expecte=
d_attach_type !=3D BPF_MODIFY_RETURN) {
9e4e01dfd3254c KP Singh               2020-03-29  3274  			err =3D -EINVAL;
9e4e01dfd3254c KP Singh               2020-03-29  3275  			goto out_put_pro=
g;
9e4e01dfd3254c KP Singh               2020-03-29  3276  		}
9e4e01dfd3254c KP Singh               2020-03-29  3277  		break;
9e4e01dfd3254c KP Singh               2020-03-29  3278  	case BPF_PROG_TYPE=
_EXT:
9e4e01dfd3254c KP Singh               2020-03-29  3279  		if (prog->expecte=
d_attach_type !=3D 0) {
9e4e01dfd3254c KP Singh               2020-03-29  3280  			err =3D -EINVAL;
9e4e01dfd3254c KP Singh               2020-03-29  3281  			goto out_put_pro=
g;
9e4e01dfd3254c KP Singh               2020-03-29  3282  		}
9e4e01dfd3254c KP Singh               2020-03-29  3283  		break;
9e4e01dfd3254c KP Singh               2020-03-29  3284  	case BPF_PROG_TYPE=
_LSM:
9e4e01dfd3254c KP Singh               2020-03-29  3285  		if (prog->expecte=
d_attach_type !=3D BPF_LSM_MAC) {
9e4e01dfd3254c KP Singh               2020-03-29  3286  			err =3D -EINVAL;
9e4e01dfd3254c KP Singh               2020-03-29  3287  			goto out_put_pro=
g;
9e4e01dfd3254c KP Singh               2020-03-29  3288  		}
9e4e01dfd3254c KP Singh               2020-03-29  3289  		break;
9e4e01dfd3254c KP Singh               2020-03-29  3290  	default:
fec56f5890d93f Alexei Starovoitov     2019-11-14  3291  		err =3D -EINVAL;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3292  		goto out_put_prog;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3293  	}
fec56f5890d93f Alexei Starovoitov     2019-11-14  3294  =

4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3295  	if (tgt_prog_f=
d) {
5f80eb32851d7a Menglong Dong          2024-02-20  3296  		if (!btf_id) {
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3297  			err =3D -EIN=
VAL;
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3298  			goto out_put=
_prog;
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3299  		}
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3300  		tgt_prog =3D =
bpf_prog_get(tgt_prog_fd);
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3301  		if (IS_ERR(tg=
t_prog)) {
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3302  			tgt_prog =3D=
 NULL;
5f80eb32851d7a Menglong Dong          2024-02-20  3303  			/* tgt_prog_fd i=
s the fd of the kernel module BTF */
5f80eb32851d7a Menglong Dong          2024-02-20  3304  			attach_btf =3D b=
tf_get_by_fd(tgt_prog_fd);
5f80eb32851d7a Menglong Dong          2024-02-20  3305  			if (IS_ERR(attac=
h_btf)) {
5f80eb32851d7a Menglong Dong          2024-02-20  3306  				attach_btf =3D =
NULL;
5f80eb32851d7a Menglong Dong          2024-02-20  3307  				err =3D -EINVAL;
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3308  				goto out_pu=
t_prog;
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3309  			}
5f80eb32851d7a Menglong Dong          2024-02-20  3310  			if (!btf_is_kern=
el(attach_btf)) {
5f80eb32851d7a Menglong Dong          2024-02-20  3311  				btf_put(attach_=
btf);
5f80eb32851d7a Menglong Dong          2024-02-20  3312  				err =3D -EOPNOT=
SUPP;
5f80eb32851d7a Menglong Dong          2024-02-20  3313  				goto out_put_pr=
og;
5f80eb32851d7a Menglong Dong          2024-02-20  3314  			}
5f80eb32851d7a Menglong Dong          2024-02-20  3315  		} else if (prog->=
type =3D=3D BPF_PROG_TYPE_TRACING &&
5f80eb32851d7a Menglong Dong          2024-02-20  3316  			   tgt_prog->typ=
e =3D=3D BPF_PROG_TYPE_TRACING) {
5f80eb32851d7a Menglong Dong          2024-02-20  3317  			prog->aux->attac=
h_tracing_prog =3D true;
5f80eb32851d7a Menglong Dong          2024-02-20  3318  		}
5f80eb32851d7a Menglong Dong          2024-02-20  3319  		key =3D bpf_tramp=
oline_compute_key(tgt_prog, attach_btf,
5f80eb32851d7a Menglong Dong          2024-02-20  3320  						 btf_id);
5f80eb32851d7a Menglong Dong          2024-02-20  3321  	} else if (btf_id)=
 {
5f80eb32851d7a Menglong Dong          2024-02-20  3322  		attach_btf =3D bp=
f_get_btf_vmlinux();
5f80eb32851d7a Menglong Dong          2024-02-20  3323  		if (IS_ERR(attach=
_btf)) {
5f80eb32851d7a Menglong Dong          2024-02-20  3324  			attach_btf =3D N=
ULL;
                                                                           =
     ^^^^^^^^^^^^^^^^^^
This needs to be done after the "err =3D " assignment on the next line.

5f80eb32851d7a Menglong Dong          2024-02-20 @3325  			err =3D PTR_ERR(=
attach_btf);
                                                                           =
     ^^^^^^^^^^^^^^^^^^^^^^^^^^
Here.

5f80eb32851d7a Menglong Dong          2024-02-20  3326  			goto out_unlock;
5f80eb32851d7a Menglong Dong          2024-02-20  3327  		}
5f80eb32851d7a Menglong Dong          2024-02-20  3328  		if (!attach_btf) {
5f80eb32851d7a Menglong Dong          2024-02-20  3329  			err =3D -EINVAL;
5f80eb32851d7a Menglong Dong          2024-02-20  3330  			goto out_unlock;

"link" is not initialized on this goto path so it leads to an
uninitialized variable warning.

5f80eb32851d7a Menglong Dong          2024-02-20  3331  		}
5f80eb32851d7a Menglong Dong          2024-02-20  3332  		btf_get(attach_bt=
f);
5f80eb32851d7a Menglong Dong          2024-02-20  3333  		key =3D bpf_tramp=
oline_compute_key(NULL, attach_btf, btf_id);
5f80eb32851d7a Menglong Dong          2024-02-20  3334  	} else {
5f80eb32851d7a Menglong Dong          2024-02-20  3335  		attach_btf =3D pr=
og->aux->attach_btf;
5f80eb32851d7a Menglong Dong          2024-02-20  3336  		/* get the refere=
nce of the btf for bpf link */
5f80eb32851d7a Menglong Dong          2024-02-20  3337  		if (attach_btf)
5f80eb32851d7a Menglong Dong          2024-02-20  3338  			btf_get(attach_b=
tf);
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3339  	}
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3340  =

70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3341  	link =3D kzalloc(s=
izeof(*link), GFP_USER);
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3342  	if (!link) {
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3343  		err =3D -ENOMEM;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3344  		goto out_put_prog;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3345  	}
f7e0beaf39d386 Kui-Feng Lee           2022-05-10  3346  	bpf_link_init(&lin=
k->link.link, BPF_LINK_TYPE_TRACING,
f2e10bff16a0fd Andrii Nakryiko        2020-04-28  3347  		      &bpf_tracin=
g_link_lops, prog);
f2e10bff16a0fd Andrii Nakryiko        2020-04-28  3348  	link->attach_type =
=3D prog->expected_attach_type;
2fcc82411e74e5 Kui-Feng Lee           2022-05-10  3349  	link->link.cookie =
=3D bpf_cookie;
70ed506c3bbcfa Andrii Nakryiko        2020-03-02  3350  =


[ snip ]

3aac1ead5eb6b7 Toke H=F8iland-J=F8rgensen 2020-09-29  3474  	prog->aux->dst=
_trampoline =3D NULL;
5f80eb32851d7a Menglong Dong          2024-02-20  3475  	prog->aux->mod =3D=
 NULL;
3aac1ead5eb6b7 Toke H=F8iland-J=F8rgensen 2020-09-29  3476  	mutex_unlock(&=
prog->aux->dst_mutex);
3aac1ead5eb6b7 Toke H=F8iland-J=F8rgensen 2020-09-29  3477  =

a3b80e1078943d Andrii Nakryiko        2020-04-28  3478  	return bpf_link_se=
ttle(&link_primer);
3aac1ead5eb6b7 Toke H=F8iland-J=F8rgensen 2020-09-29  3479  out_unlock:
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3480  	if (tr && tr !=
=3D prog->aux->dst_trampoline)
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3481  		bpf_trampolin=
e_put(tr);
5f80eb32851d7a Menglong Dong          2024-02-20  3482  	if (mod && mod !=
=3D prog->aux->mod)
5f80eb32851d7a Menglong Dong          2024-02-20  3483  		module_put(mod);
3aac1ead5eb6b7 Toke H=F8iland-J=F8rgensen 2020-09-29  3484  	mutex_unlock(&=
prog->aux->dst_mutex);
3aac1ead5eb6b7 Toke H=F8iland-J=F8rgensen 2020-09-29 @3485  	kfree(link);
                                                                      ^^^^

fec56f5890d93f Alexei Starovoitov     2019-11-14  3486  out_put_prog:
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3487  	if (tgt_prog_f=
d && tgt_prog)
4a1e7c0c63e02d Toke H=F8iland-J=F8rgensen 2020-09-29  3488  		bpf_prog_put(=
tgt_prog);
5f80eb32851d7a Menglong Dong          2024-02-20  3489  	btf_put(attach_btf=
);
fec56f5890d93f Alexei Starovoitov     2019-11-14  3490  	return err;
fec56f5890d93f Alexei Starovoitov     2019-11-14  3491  }

-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
