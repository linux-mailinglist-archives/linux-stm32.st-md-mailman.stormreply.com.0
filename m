Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3494F849634
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Feb 2024 10:17:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0563C6DD60;
	Mon,  5 Feb 2024 09:17:54 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F14DEC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 18:45:39 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-204f50f305cso2033082fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 03 Feb 2024 10:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706985938; x=1707590738;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y0N/TxnXN2qBHJ/dkfZVj0nsBZc+7pjCqkkafHOcTPY=;
 b=IAnr2xkOoY14OhJyVbBzHXyZsdBcH8Pn06eLcXi+nQWeUi17Im+pVu/8RAtz8VEi8l
 1ksVtnS9luZ9FDE73SC3J16LLwax98BurqE0z/tYRsZSwF/djTjNfRM9dKm/BkZMhjuO
 WbpWuNpqdlgV73dzaoDfX73OQMPq8p1SCSygvon204EGphAgt0itcqqGSKSe1IBnWL67
 OKDblSkt2UB2UTr96Whp9vDYc3RYBh/Up3W/12PuTdtnBON8Li2wyM5oqwkV06JPi0Bi
 d21ZhY0yXA4ywlMTjTSI5QlAVKflqiGJVbG0VaLzzJFVv91WYq1mqwl/dtKElNqDF8pY
 uUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706985938; x=1707590738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0N/TxnXN2qBHJ/dkfZVj0nsBZc+7pjCqkkafHOcTPY=;
 b=XfcL9+YkPhjiFOgmuKtNyxRVvPo8yMogypniIourR1GvE1syOxJx3G6r5oCgPXLbvD
 KwD+Jf3yjHML8ksS/HcbLFKjwfcNMWwC6jkxE320J7JjNms3G3rJb/+RZoFWQVr2Xx9g
 AwgnlBrnj4XBpEbKBRj55V15vCFVvCZfQOQul5qwc31nXVRDj1Wd7W/p6o4n8SjCgf0J
 2DmBqsPYTMAAtTqZB2PUCZaAt6oojClxSWbEcdheD+9H9MLu7Dak+XwXeBPB0TUAcHol
 tdMruavXFaxsYLiPH1wBSK9mspNhUPLOzCQYOy58hbhNZaizK7QcwzT2X5bjaNj/294h
 kD/g==
X-Gm-Message-State: AOJu0Yx43viQ/c2FM0jALbDSl/ISJcur+BeVHhB5hYfFEAt1Aei4jh2o
 qjQ6FV0dWmbMqnon7UGSABeZqACa9BhgRQdhYEQkuhBSaA/SwDqA
X-Google-Smtp-Source: AGHT+IE6cTsFsYxec6Cc2Nv8r8Wv7UwdJ2OkD0GT9fp4iaKTaMhjHiWk6mQDIasAcDiqRAsVsbikAg==
X-Received: by 2002:a05:6870:4149:b0:214:ff12:3dda with SMTP id
 r9-20020a056870414900b00214ff123ddamr3816197oad.2.1706985938425; 
 Sat, 03 Feb 2024 10:45:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUQOTzlsO8lgt6pTwZLPw4119LfUrIfiaPa1wTTfdoxvsVTK1OcV2Dhbg5b2iobZcoC99Y+nA1mfBlqm8ccNuDEZ9ovSOSxF3dHJJoFa8pVW2wvNSbjP7RHN1nQlbwYiR+ZGUGPHsYbVIKUu/kExr3+mBS2LyoL7EMCy0RKTBCwZmgSJAnm8YjNjZATBXumi5rZ1guYYVe6tbB3apJ1FiMecZeZOLFGPHLSIm9lMMnedLrSL5LR+ITrAlKqzgfOzWbsLuUM4d0ufoM4ZdW8uS+lgajFrBnb5Unl8KMrPo5f7fVRDTzb+mpkXuSEfXp+VxBl9aBdT1X4Pu6RO2Vb+J9irkfLOt6ydfNho4jZIfhH5e7RejlM3xop2REcBU+7Ep2QxW6BfVclBjRvfADINXaS9e2RfWdRXu9F1/Yl7W4aoQMsEnydZd5izTj9tgYTVMJznLUUlABQlG1XUF+lALvWG6wGjF/JBqJwIeKsgiHWrSlTkPAQMEc11zIv9TBj/SgdR+1IGkyuC42IrbIYBRA6Lh1HyFcyKl9okR8mk02mHyKzcQcLfR3w3JL3Ur9d5SVkncclHqL1PxkDpGPOs3dE++/rIX2sEot24DS//9lxdPUpALKMpt4xa0iv27eylxppX5U6yH5xrfrThO7kAWWBey3QFiyYH1/6c0o0YhJJldRm9x6QOyyQUBjy8xYN3sw+NkNgjLDcwTs+DRby93OBGQ==
Received: from surya ([70.134.61.176]) by smtp.gmail.com with ESMTPSA id
 g37-20020a635665000000b005d748902a01sm3945514pgm.43.2024.02.03.10.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:45:37 -0800 (PST)
Date: Sat, 3 Feb 2024 10:45:11 -0800
From: Manu Bretelle <chantr4@gmail.com>
To: Jiri Olsa <olsajiri@gmail.com>
Message-ID: <Zb6Jt30bNcNhM6zR@surya>
References: <cover.1706491398.git.dxu@dxuuu.xyz> <Zb12EZt0BAKOPBk/@surya>
 <Zb5QWCw3Tg26_MDa@krava>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zb5QWCw3Tg26_MDa@krava>
X-Mailman-Approved-At: Mon, 05 Feb 2024 09:17:53 +0000
Cc: fsverity@lists.linux.dev, linux-doc@vger.kernel.org, vmalik@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexei.starovoitov@gmail.com, netfilter-devel@vger.kernel.org,
 memxor@gmail.com, coreteam@netfilter.org, Daniel Xu <dxu@dxuuu.xyz>,
 quentin@isovalent.com, linux-kselftest@vger.kernel.org,
 linux-input@vger.kernel.org, cgroups@vger.kernel.org, bpf@vger.kernel.org,
 alan.maguire@oracle.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 0/3] Annotate kfuncs in
	.BTF_ids section
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Sat, Feb 03, 2024 at 03:40:24PM +0100, Jiri Olsa wrote:
> On Fri, Feb 02, 2024 at 03:09:05PM -0800, Manu Bretelle wrote:
> > On Sun, Jan 28, 2024 at 06:24:05PM -0700, Daniel Xu wrote:
> > > === Description ===
> > > 
> > > This is a bpf-treewide change that annotates all kfuncs as such inside
> > > .BTF_ids. This annotation eventually allows us to automatically generate
> > > kfunc prototypes from bpftool.
> > > 
> > > We store this metadata inside a yet-unused flags field inside struct
> > > btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
> > > 
> > > More details about the full chain of events are available in commit 3's
> > > description.
> > > 
> > > The accompanying pahole and bpftool changes can be viewed
> > > here on these "frozen" branches [0][1].
> > > 
> > > [0]: https://github.com/danobi/pahole/tree/kfunc_btf-v3-mailed
> > > [1]: https://github.com/danobi/linux/tree/kfunc_bpftool-mailed
> > 
> > 
> > I hit a similar issue to [0] on master
> > 943b043aeecc ("selftests/bpf: Fix bench runner SIGSEGV")
> >  when cross-compiling on x86_64 (LE) to s390x (BE).
> > I do have CONFIG_DEBUG_INFO_BTF enable and the issue would not trigger if
> > I disabled CONFIG_DEBUG_INFO_BTF (and with the fix mentioned in [0]).
> > 
> > What seems to happen is that `tools/resolve_btfids` is ran in the context of the
> > host endianess and if I printk before the WARN_ON:
> > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > index ef380e546952..a9ed7a1a4936 100644
> >   --- a/kernel/bpf/btf.c
> >   +++ b/kernel/bpf/btf.c
> >   @@ -8128,6 +8128,7 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
> >            * WARN() for initcall registrations that do not check errors.
> >            */
> >           if (!(kset->set->flags & BTF_SET8_KFUNCS)) {
> >   +        printk("Flag 0x%08X, expected 0x%08X\n", kset->set->flags, BTF_SET8_KFUNCS);
> >                   WARN_ON(!kset->owner);
> >                   return -EINVAL;
> >           }
> > 
> > the boot logs would show:
> >   Flag 0x01000000, expected 0x00000001
> > 
> > The issue did not happen prior to
> > 6f3189f38a3e ("bpf: treewide: Annotate BPF kfuncs in BTF")
> > has only 0 was written before.
> > 
> > It seems [1] will be addressing cross-compilation, but it did not fix it as is
> > by just applying on top of master, so probably some of the changes will also need
> > to be ported to `tools/include/linux/btf_ids.h`?
> 
> the fix in [1] is fixing flags in set8's pairs, but not the global flags
> 
> it looks like Viktor's fix should now also swap that as well? like in the
> change below on top of Viktor's changes (untested)
> 
> jirka
> 
> 
> ---
> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
> index d01603ef6283..c44d57fec390 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c
> @@ -706,6 +706,8 @@ static int sets_patch(struct object *obj)
>  			 * correctly translate everything.
>  			 */
>  			if (need_bswap) {
> +				set8->flags = bswap_32(set8->flags);
> +
>  				for (i = 0; i < cnt; i++) {
>  					set8->pairs[i].flags =
>  						bswap_32(set8->pairs[i].flags);
> 

That should work. Here are a few tests I ran:

$ md5sum /tmp/kbuild-s390x/vmlinux.*
eb658e51e089f3c5b2c8909a29dc9997  /tmp/kbuild-s390x/vmlinux.a
# plain vmlinux before running resolv_btfids (all 0s)
ea907cd46a1a73b8276b5f2a82af00ca  /tmp/kbuild-s390x/vmlinux.before_resolv
# x86_64 resolv_btfids on master without Viktor's patch
980a40c3a3ff563d1c2d1ebdd5071a23  /tmp/kbuild-s390x/vmlinux.resolv_native
# x86_64 resolv_btfids on master with Viktor's patch
b986d19e242719ebea41c578235da662  /tmp/kbuild-s390x/vmlinux.resolv_native_patch_viktor
# x86_64 resolv_btfids on master with Viktor's patch and your suggested patch
4edd8752ff01129945bd442689b1927b  /tmp/kbuild-s390x/vmlinux.resolv_native_patch_viktor_patched
# s390x resolv_btfids run with qemu-s390x-static
4edd8752ff01129945bd442689b1927b  /tmp/kbuild-s390x/vmlinux.resolv_s390x


and some hexdiff of those binaries:


# difference between master's native build and s390x build.... has byte swapping for set8 and others
diff -ruN <(xxd /tmp/kbuild-s390x/vmlinux.resolv_s390x) <(xxd /tmp/kbuild-s390x/vmlinux.resolv_native) > diff_s390x_native.diff
https://gist.github.com/chantra/c3d58637a08a6f7340953dc155bb18cc

# difference betwee Viktor's version and  s390x build.... squinting my eyes I only see the global set8 is missing
diff -ruN <(xxd /tmp/kbuild-s390x/vmlinux.resolv_s390x) <(xxd /tmp/kbuild-s390x/vmlinux.resolv_native_patch_viktor) > diff_s390x_native_viktor.diff
https://gist.github.com/chantra/61cfff02b456ae72d3c0161ce1897097

Have a good weekend all!

Manu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
