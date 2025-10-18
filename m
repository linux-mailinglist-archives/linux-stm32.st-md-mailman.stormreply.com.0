Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4FCBEC2ED
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Oct 2025 02:43:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46431C57A44;
	Sat, 18 Oct 2025 00:43:00 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78BA1C57A42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 00:42:59 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b556284db11so2093220a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 17:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760748178; x=1761352978;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1PWNtFrwP/oSzLfkwsnt+/gfiH1RiWv5c2UepBm6CR8=;
 b=jCHjjuh61TeyyxJa/ZoRyppyu19tANstAZ49hxZcyloMQLpgkaT01N6hqCjIhn+3ZD
 0oc4AaEtLs7XUHSFgcXuqeLoMxGJsJueHQnNDO9LW33iXniW+2DxqC+JlZSVYv7UqMHU
 dzglLSMvNTTBm0lsUA0ujpbSLlMBvbFMUZXNaUXyZfT4D9beDUSJezh56jxKvHwRZ7Pt
 DW6WlrVtK65CWA1OPC5ZHsN9yhPqjRmVODENqcgugrrBLa1sfdqgI16fGQ5bT3bAo3Jb
 Q1pijsJ4iDPuLYlujGbgWzlazU74Ql484j+8wohY7Mo2bJlRWOQTJnx4uS5n6Py0Gxmx
 M2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760748178; x=1761352978;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1PWNtFrwP/oSzLfkwsnt+/gfiH1RiWv5c2UepBm6CR8=;
 b=RDOFuQoqriFi49ts6AFOcERf9DbseQZZdB68eLpZDcxLVU7nREbYmg++/+/d8TcL4t
 mDrA5ENxbNj9BXXvvfGbIm7KfYRbLMa1EwFOebZSztS9W/uighPw1uZ1YtHo8hkPaEeo
 H9E/xVmkuYzaTVWj333PHElsNbrinLul0MQYP08k8csGO8mCFbV5ye2hTDFe4dyK3aT4
 5Qoo90m32IY24GHAmXw1OtOz/YK7k76XUTcMQ/UsfKJw8ohzcofLi2l2jYWc8GaPVhab
 HfLeLXoj2zb63Ckg78Z9jrI9Imf/uJofoNIJO0wmcD6/C+0Cj6nPOm39Lb3WQVVZ+7WV
 XFUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrBN/uR8VQpDgNMozcnsl9sWjzeD3VU80GxvJr269dljYF1lS4VJrD/rKhQZhWfGiJVWCmT9S7dJGmIQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyZuhkbYp+VNWVpGeSfcbpcU6WR8gRV/zxIFXCi3idtiyOSej8f
 +JN5Fs48OLbFWWZWsTFCgshdpBJ8r2pNrkhNPqSgTQ5ISV917unqpHFb
X-Gm-Gg: ASbGncvBAEXVlGllXcyGtT+xSyUIKXYhNIFUWWEJdF+slyKl6c+qwCHLyiyQNEvp5JL
 XPWVzeFgQ2zeCZz1f+xzF5zaNO4/A0VUQi+ubhNHyl8ZiiZLGM+EaV5d+bHJSWsBWElFqZdX/YR
 MV8ib4pr24AbznSHd93SbKv/vVJx2gymV2KLkopTLaFnTIhQlv3QfJduElQkDFNfb7XCBRrZ+9t
 wF3+WUm7/AGi56olwetgAbS35aVAz/wAmdkqsDXTt40cZh8ESxsHchmWPGVX1pyW1ltY2r6FEe8
 dqi9t06MdnAA42J0YwUbSHK7K8g7UZHSyxX0dDlK9bNrZ/V7+i8ouLPCON68HuktILk4j12Zjjv
 YQHfhDcvCZFWCEK8ZM81QpBd+Q2WEv+zhF35eDm5lKQASM12cqTf+PT/ItllQzZCI5tf+Os7gYK
 s=
X-Google-Smtp-Source: AGHT+IHk6GRhreHj//S6E+ILpNLEY2kapbyNg9O/WZnXJ0JV/NPB8zjD9Ghulw354rOmUlzfDrJAcA==
X-Received: by 2002:a17:903:1746:b0:269:a4ed:13c9 with SMTP id
 d9443c01a7336-290caf85146mr63860745ad.30.1760748177829; 
 Fri, 17 Oct 2025 17:42:57 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471d5874sm7975275ad.54.2025.10.17.17.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 17:42:57 -0700 (PDT)
Date: Sat, 18 Oct 2025 08:42:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
Cc: linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
 sophgo@lists.linux.dev, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Longbin Li <looong.bin@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

On Fri, Oct 17, 2025 at 08:16:17PM +0200, Andrew Lunn wrote:
> On Fri, Oct 17, 2025 at 09:18:01AM +0800, Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be remove
> > when init the mac, otherwise the phy will be misconfigurated.
> 
> Are there any in tree DT blobs using invalid phy-modes? In theory,
> they should not work, but sometimes there is other magic going on. I
> just want to make sure this is not going to cause a regression.
> 

I see no SG2042 board using invalid phy-modes. Only rgmii-id is used,
which is vaild.

> Also, does the DT binding document list the valid phy-modes?
> 

It does not list. Is it better for me to add a list for it?

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
