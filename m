Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586F82CCDE
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jan 2024 14:57:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0432C6B460;
	Sat, 13 Jan 2024 13:57:44 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A655DC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jan 2024 13:57:43 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so856400866b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jan 2024 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705154263; x=1705759063;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PGE1HEJ5ixxTvOXVNxbbYY7sOdvQr1NpAqO6gUYLh08=;
 b=RD+FB8gZ3dumFZgcO5Qnk71jwhmOATwCZ+VC6dyRRBkcv9iiGRMFSdbPplwKmCw+wh
 cJng6yJrqhJmGZLGE+WpmRN7ItBeULPRzwFfmi/2kaUdeBAodIbtaH2uG9jUgxSza8sr
 7XbpUxI+LEcVlIa8A2fzgs++YO1XTUjEH9q0RdbGEhB0mYTofpAWnAzJG0MQqU+uJjh7
 McfXyCcuTT7f0trFOmwvXPA+lJSMaseYvuPbCLjMrZu2mPcsBB9nyHyBud+bXxHac1yb
 w9WW6k4wP99D6igqSFHy327Y+dkDVlIMMeMZTJqOv90T54S/VbbbqkHK3sq7Brr76iGY
 +2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705154263; x=1705759063;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGE1HEJ5ixxTvOXVNxbbYY7sOdvQr1NpAqO6gUYLh08=;
 b=uKNvbJ9fDtr7CLU6hyPjRp5nWmLuYXKJkVXFQJSpCRIjiY5m0cKOjQrgHa1bJ+6POm
 CYI2/s9CjvRxw5X7dBnTJO5QxUM/RwS2aHuYZ/1TYiI7GpTqi3ub+OmIOUcVP65tYmf/
 oO2R+bAeGiP6V8YKFFer8rONK4GZD5sVaJfqByAbEWezlew5C+ILMfe5wZfNd8/MTx0I
 TrKRoaablyQJ9w8TbsD8OiLyDHeQ+572u2AKdLXMF+npBk41haaZO73dYQ2aw6fEw/nE
 +E+C9qgysCjH89oaOMa8UyW556gfg+7r2Gukr9p94DLbIhoxk+C6jWVl+9LwqHU6bTcm
 uTPQ==
X-Gm-Message-State: AOJu0YwPndN9z7pUyKcRoj+TtqjqIQr+KtOMXdjkK77uaq5sVaJTlMPC
 1/K5Uc9E7yJw6175brg7F6E=
X-Google-Smtp-Source: AGHT+IFMOIYDYiCqRWjRhgVi6B2d5peHDNTF2jXuwvHB8FKts87L7ld0sC7DRk8qiddMgjxRgmPzDw==
X-Received: by 2002:a17:906:15c3:b0:a2b:1a80:7b72 with SMTP id
 l3-20020a17090615c300b00a2b1a807b72mr1514786ejd.30.1705154262796; 
 Sat, 13 Jan 2024 05:57:42 -0800 (PST)
Received: from krava (ip-94-113-247-30.net.vodafone.cz. [94.113.247.30])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a170906150400b00a2a37f63216sm2950887ejd.171.2024.01.13.05.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 05:57:42 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 13 Jan 2024 14:57:40 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Message-ID: <ZaKW1AghwUnVz_c4@krava>
References: <cover.1704565248.git.dxu@dxuuu.xyz> <ZaFm13GyXUukcnkm@krava>
 <2dhmwvfnnqnlrui2qcr5fob54gdsuse5caievct42trvvia6qe@p24nymz3uttv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2dhmwvfnnqnlrui2qcr5fob54gdsuse5caievct42trvvia6qe@p24nymz3uttv>
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 0/3] Annotate kfuncs in
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

On Fri, Jan 12, 2024 at 01:03:59PM -0700, Daniel Xu wrote:
> On Fri, Jan 12, 2024 at 05:20:39PM +0100, Jiri Olsa wrote:
> > On Sat, Jan 06, 2024 at 11:24:07AM -0700, Daniel Xu wrote:
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
> > > The accompanying pahole changes (still needs some cleanup) can be viewed
> > > here on this "frozen" branch [0].
> > 
> > so the plan is to have bpftool support to generate header file
> > with detected kfuncs?
> 
> Yep, that's the major use case. But I see other use cases as well like

ok, any chance you could already include it in the patchset?
would be a great way to test this.. maybe we could change
selftests to use that

thanks,
jirka


> precision probing of kfuncs. Rather than guess and check which progs can
> load (in the event of backwards incompatible kfunc changes), programs
> can look at kfunc type signature thru BTF.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
