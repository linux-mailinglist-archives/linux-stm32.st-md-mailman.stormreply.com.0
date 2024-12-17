Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E79F3F62
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 01:48:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94A5EC7129D;
	Tue, 17 Dec 2024 00:48:03 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9E57C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 00:47:55 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6d8e773ad77so39258896d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 16:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734396475; x=1735001275;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RrUU1sA/PquF8Kcvm4irBd461MDD9nPT0JTqTCo4L28=;
 b=jmqHvvDeOWTeGruc7VAhNtI5wodTq/n1dJDKtfEFniuTy2ea2d3oC/bxbewKCpk1EG
 yHghSCR1uV+4/nrTYdrH8GTNeiC9KqN1JrEF0xMg2t88yCRRaRVW5Sr63Bxp4fNvLc8+
 ZUoZKOQa1UdwRKOHGT4E/F6qO5LUncFqQhC9S9J+Fi9cLatvazC5QHuYRNvPFwT4222/
 CT/n27aoycQ9sG0xZj7PviaPsFSfcx2gpV2S3JbwEG3Q+5Vo4YQ59a0fCd5Co3I4lYqu
 QnbMtUt3Ty+qctOR6GfWHTG7sxdVYIS9q0t0YSPY4eOKP2an3rQdBOsQ89KQ+sWCPnsA
 CuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734396475; x=1735001275;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrUU1sA/PquF8Kcvm4irBd461MDD9nPT0JTqTCo4L28=;
 b=LJldsEdhSVG7cdX67I4un5krTQGZ4I0o/j+7W1zZZ/J7LGEFb2Sb3LVHUx3HHukc7n
 ti3jvwPu6yKdaLfvQzSnzaR2WoqHd68FnXgjjrAcZ4GbefEfXtEDJraq9tY8WoseRBjc
 LR6iObADlDd+hsSI2aO1f7KNJcF/WSlAGUeyK/weQCPGLQLd/5g4jNpGPBD7DB+sElmv
 ya5Sihazt3VTFpgnR2DTIUoowQbxogBgoXYf8sQqk5zZTuKQmqTdEi43gb31ybUzkxBw
 6rp6w4UeMnzuLExtSgGnUpoDcePRBzHdGYG5WK/ufodK+7TFv3zngGFQxiIZO2XMK9lO
 mBsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn9xEctFJEcxAR5Z4zA6q9nLqQDAepOck1kNqayeJkHxwL0dVVn2W1Qc/5+JC53uwPFLBSoId1k3Wqfw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyUXEtJ8jZIpx/UPq+2wiHgslUeXNUtiPdPEdX06UNyWBSYX33M
 DiebEXjUS/EBWaKYVqwFBi71gB/SdftEyXoXDbhHePQGk/Vg89IH
X-Gm-Gg: ASbGncvLCOP4QYidVPMp1VmVDpueNIBIDYrhhjSMGbBtSa+/t46KnG5O1IgTB55DBGB
 DIuWpOys192LWnEqAANe7BV7yW4NOAxP7JqNnzLBhptnB6/l/aHsPpSE5Tczw/RTqHQwQWXObys
 WblOaNNv7HL+FHKCRhZTVGWE+OWUbRVaFAg3idEWUsri6qvk8RhZs+9rmUWH/ED4zdVWHiYCiyl
 HRTqF/2VoISPHjzo5+yqyfG5yfPnqMh
X-Google-Smtp-Source: AGHT+IHkNqEBTJEhiLtyWa2CGVz+1od1KR/2tzYm9ObLc/fC9+AGP2+40XW+DImZ8NXvMV8LHBW42w==
X-Received: by 2002:a05:6214:19c3:b0:6d4:36ff:4356 with SMTP id
 6a1803df08f44-6dc8ca74ec1mr289693926d6.19.1734396474867; 
 Mon, 16 Dec 2024 16:47:54 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6dccd38078fsm32822106d6.119.2024.12.16.16.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 16:47:54 -0800 (PST)
Date: Tue, 17 Dec 2024 08:47:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Message-ID: <puld3vngm4rti74aecpeoro3tatifgasrq6sxg4huufuptmjtk@njfskna3k7ds>
References: <20241101014327.513732-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241101014327.513732-1-inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 0/3] riscv: sophgo: Add
 ethernet support for SG2044
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

On Fri, Nov 01, 2024 at 09:43:24AM +0800, Inochi Amaoto wrote:
> The ethernet controller of SG2044 is Synopsys DesignWare IP with
> custom clock. Add glue layer for it.
> 
> Since v2, these patch depends on that following patch that provides
> helper function to compute rgmii clock, and this patch are marked as RFC:
> https://lore.kernel.org/netdev/20241028-upstream_s32cc_gmac-v4-4-03618f10e3e2@oss.nxp.com/
> 

Hi,

I have seen the dependency has been merged, is it possible to 
resend a normal version of this patch?

https://lore.kernel.org/netdev/173380743727.355055.17303486442146316315.git-patchwork-notify@kernel.org/

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
