Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CECA87E57
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 13:04:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63BD8C7803B;
	Mon, 14 Apr 2025 11:04:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53831C78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 11:04:46 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39c1ee0fd43so4015672f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 04:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744628685; x=1745233485;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sKIv+Ew1hQAFZsKTKMtzV43PXBAkEaoS28OQ89MT8N8=;
 b=MBaUv2ohdspGuOJVNX2crc5YPqdM+zuxEqD5nShpL0/J9oI3qHmWswOF/G6T2nMAE3
 6Set5ihKsWpMYR9jweOwkj3C7wKcTEi3yXDkOmSX+8AOhJucJGuOoOnjAN6Cwp+YUIcm
 SL1DLAQrGK+olxJ/RAjNS/tSm4BGBL6EypmT1Ia4lBcF4r/570nK/0xl8/MRy3qbwoc1
 3J2rKWM79VXZ6eMNj0Q+E8QqXAogSxd2Ihwgp5CRYkD3+taobX0g2ZyWHJ4H/esmMtqt
 gMdBczWxojL+Zr66VK8RUW/p+rYHmVt6EpyP53gyizbFQ85wm9u0EU9KZHacB8rLgyFn
 5iHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744628685; x=1745233485;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sKIv+Ew1hQAFZsKTKMtzV43PXBAkEaoS28OQ89MT8N8=;
 b=eoqKmVmnmcFUFnOqHS98tARvHE7XsXzYgwUcVvwIUyHtXjMP0frfn81zxzCRkqE+MH
 oMHQqEAnyHOmSBG3J2LTrkmdWb+WR5IziY0/oYByCQ3addXMHX4NLQJ43iYaTXIUBYbd
 LFChzBv0qrxvKrKTSE7ILhu5rrsqsa2NztM9LZA8UIjvhEgMIZgPPCgk+v+dkz6WXTcB
 uujKpU26gqC+SB/TCxC8tY3kXBZtzecihXl2HmglsLUd2JumQwB+Gz5P3pcIaw7/xqcl
 O6j5m9ZT4VywVprgIeCozAPE1yG/8mQTKLGeN6NtZniU46n897MvUfRPgS+iMrvc5xBf
 O8Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXWIicccIPZ/i1ohc23vhXJ4CF97IQbQCnXPYkNpm+u46ak3IIQJeVz0JF88tB6mR/mmLWzKbs+Oiebw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwneNi2b0jA4BLp8xL6GGksOvIYGHIArUoubxGOq4PXG7R4WsLe
 6VeXCHax4Rv/YpwXZwOSdu1yIAVebzy6QJcLBP/ZIJBCDeOL04da
X-Gm-Gg: ASbGncsUC0CDvD1i8R8icBYnDRbv3+ANK+NLn9oAsGxaFcuxz5huladYx5IfBJCYlNf
 usV2oY3xcbMbU0DP9N7tNrjW1pGMUSXVbq6MQhbONbfGzjwjjSQ2tV77iG1kfo1NCfWk0iIlFj/
 rkYv7n0cnu8hnRgcOcm4HkP2ou3bIqyK22905WtHbRAML+rrE2lT4YVJ5SWDP5rZ62K38NBzuuE
 JbYyXPimyMLpBerg7sQirHW+XbvMj6JqXIXt5v1wHO8Om6zhsW68ZY2ym4NdhSecXOhOfMuzFHG
 FXJcJ9TlVPQCN/02jNsBXegcblX6+Qs=
X-Google-Smtp-Source: AGHT+IGrvwgLQedKQvifH2Jvu4TYIj9/pf5+d/bwg1/VjkLHL4cwxQAuHsTjKrrtJbJPnThtPqVuQg==
X-Received: by 2002:a05:6000:144b:b0:399:6dc0:f134 with SMTP id
 ffacd0b85a97d-39eaaed20c4mr9243328f8f.51.1744628685126; 
 Mon, 14 Apr 2025 04:04:45 -0700 (PDT)
Received: from krava ([2a00:102a:4007:73e1:1681:405:90b2:869b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9777a0sm10625743f8f.43.2025.04.14.04.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:04:44 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 14 Apr 2025 13:04:41 +0200
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Message-ID: <Z_zryQkfmrSXYN4k@krava>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Will Deacon <will@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 ebpf@linuxfoundation.org, Xu Kuohai <xukuohai@huaweicloud.com>,
 Alexei Starovoitov <ast@kernel.org>, KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Hao Luo <haoluo@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 1/4] bpf: add struct largest
 member size in func model
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

On Fri, Apr 11, 2025 at 10:32:10PM +0200, Alexis Lothor=E9 (eBPF Foundation=
) wrote:
> In order to properly JIT the trampolines needed to attach BPF programs
> to functions, some architectures like ARM64 need to know about the
> alignment needed for the function arguments. Such alignment can
> generally be deduced from the argument size, but that's not completely
> true for composite types. In the specific case of ARM64, the AAPCS64 ABI
> defines that a composite type which needs to be passed through stack
> must be aligned on the maximum between 8 and the largest alignment
> constraint of its first-level members. So the JIT compiler needs more
> information about the arguments to make sure to generate code that
> respects those alignment constraints.
> =

> For struct arguments, add information about the size of the largest
> first-level member in the struct btf_func_model to allow the JIT
> compiler to guess the needed alignment. The information is quite
> specific, but it allows to keep arch-specific concerns (ie: guessing the
> final needed alignment for an argument) isolated in each JIT compiler.
> =

> Signed-off-by: Alexis Lothor=E9 (eBPF Foundation) <alexis.lothore@bootlin=
.com>
> ---
>  include/linux/bpf.h |  1 +
>  kernel/bpf/btf.c    | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> =

> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 3f0cc89c0622cb1a097999afb78c17102593b6bb..8b34dcf60a0ce09228ff761b9=
62ab67b6a3e2263 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1106,6 +1106,7 @@ struct btf_func_model {
>  	u8 nr_args;
>  	u8 arg_size[MAX_BPF_FUNC_ARGS];
>  	u8 arg_flags[MAX_BPF_FUNC_ARGS];
> +	u8 arg_largest_member_size[MAX_BPF_FUNC_ARGS];
>  };
>  =

>  /* Restore arguments before returning from trampoline to let original fu=
nction
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 16ba36f34dfab7531babf5753cab9f368cddefa3..5d40911ec90210086a6175d56=
9abb6e52d75ad17 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -7318,6 +7318,29 @@ static int __get_type_size(struct btf *btf, u32 bt=
f_id,
>  	return -EINVAL;
>  }
>  =

> +static u8 __get_largest_member_size(struct btf *btf, const struct btf_ty=
pe *t)
> +{
> +	const struct btf_member *member;
> +	const struct btf_type *mtype;
> +	u8 largest_member_size =3D 0;
> +	int i;
> +
> +	if (!__btf_type_is_struct(t))
> +		return largest_member_size;
> +
> +	for_each_member(i, t, member) {
> +		mtype =3D btf_type_by_id(btf, member->type);
> +		while (mtype && btf_type_is_modifier(mtype))
> +			mtype =3D btf_type_by_id(btf, mtype->type);
> +		if (!mtype)
> +			return -EINVAL;

should we use __get_type_size for member->type instead ?

jirka

> +		if (mtype->size > largest_member_size)
> +			largest_member_size =3D mtype->size;
> +	}
> +
> +	return largest_member_size;
> +}
> +
>  static u8 __get_type_fmodel_flags(const struct btf_type *t)
>  {
>  	u8 flags =3D 0;
> @@ -7396,6 +7419,8 @@ int btf_distill_func_proto(struct bpf_verifier_log =
*log,
>  		}
>  		m->arg_size[i] =3D ret;
>  		m->arg_flags[i] =3D __get_type_fmodel_flags(t);
> +		m->arg_largest_member_size[i] =3D
> +			__get_largest_member_size(btf, t);
>  	}
>  	m->nr_args =3D nargs;
>  	return 0;
> =

> -- =

> 2.49.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
