Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E4D9590F8
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 01:16:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2ADFC6DD9A;
	Tue, 20 Aug 2024 23:16:43 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AE20C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 23:16:36 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2d439572aeaso147502a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 16:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724195795; x=1724800595;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QrZS09AovuuFmgGLEUEH4wrKa3bvYx4Fu0tek9TXx4s=;
 b=PuVKa9uDK698QqflQ6/kvnt1Ao+6u4kf6j2M9i8XneDjsvwrcJVH88YGqumSawDbJR
 vmP3x/mGcn8FFQ0988jki0KkVbbZQ0HzsSK6WAkcvsOLgmhQ8DsS63Gd5jFH/tm1+9/r
 n/Ij1ei4bK9Jf7dXuvcB5iFv5KG2cRi+cIJCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724195795; x=1724800595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QrZS09AovuuFmgGLEUEH4wrKa3bvYx4Fu0tek9TXx4s=;
 b=fW7ii8UmgLLn76bmYt0hgOpf935RbI44dBw8c6JwoSYPM0FTgu/W6SUIPg2/nrUI7f
 EOLJxsg7UbJZSHT7Rf/uNGQzkTEmD6QaGzqKBYAg4OBmHWdXNEzyCfUNSuFElD68+/0m
 8CbFUg+pCFxyF6jr5Hxu5t+61IvW0ezID3yHBY1c/IcQNS6rapfIyUy375QoXgNphpUU
 UMoyAApTia2zn5yxmc0eJGV4dMazafzECpAyTh2KLkXiuzn58SB/akAyaehas4jB4m+U
 ooGlLv+CfbifaOBMv8P0RjY4QeqSuAnIVC5TWaqAv8FHEyJuR5wjnepOl46WcCSBxJgZ
 qRXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWegItAIUM3NqlcAeplghioVNRa/hB2M4acbst6tyV/SS8PwTWncviBZh1Wi3mkZdc+qboWk4qyXteYMw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwGqMDcRK9o590N7ocv9qMmrCSXzqAzOSDth7KCkaPVNax354sF
 o6F/Ro3IHweMG0Q8MtNUf6uqfdu6btzAN4FTiobqzgQk6xvNtnsHnq91amQVjoPhcda+ieZKSCK
 rmMyByqERckT5LMhJv73ds1dvHdgCbznwHS6i
X-Google-Smtp-Source: AGHT+IEI+l6X7IR9T6pwKkJ8QZSEtEMczJRLjGREA1pdtgbdvp3Hq8ZiAk6iRl1Auq3JsoyP4nTpyh2MJh7WV6WdkT4=
X-Received: by 2002:a17:90b:1953:b0:2d4:91c:8882 with SMTP id
 98e67ed59e1d1-2d5e99a5c36mr770336a91.11.1724195794885; Tue, 20 Aug 2024
 16:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
 <20240814221818.2612484-5-jitendra.vegiraju@broadcom.com>
 <20240816112741.33a3405f@kernel.org>
In-Reply-To: <20240816112741.33a3405f@kernel.org>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Tue, 20 Aug 2024 16:16:22 -0700
Message-ID: <CAMdnO-LT8gChytPpw0HWqkJvL-=OWqHOY9UUj1gEXawyC=2TWA@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, linux@armlinux.org.uk,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v4 4/5] net: stmmac: Add PCI driver
	support for BCM8958x
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCBBdWcgMTYsIDIwMjQgYXQgMTE6MjfigK9BTSBKYWt1YiBLaWNpbnNraSA8a3ViYUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgMTQgQXVnIDIwMjQgMTU6MTg6MTcgLTA3MDAg
aml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tIHdyb3RlOgo+ID4gKyAgICAgcGNpX3Jlc3Rv
cmVfc3RhdGUocGRldik7Cj4gPiArICAgICBwY2lfc2V0X3Bvd2VyX3N0YXRlKHBkZXYsIFBDSV9E
MCk7Cj4gPiArCj4gPiArICAgICByZXQgPSBwY2lfZW5hYmxlX2RldmljZShwZGV2KTsKPiA+ICsg
ICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArCj4gPiArICAg
ICBwY2lfc2V0X21hc3RlcihwZGV2KTsKPgo+IHBjaV9yZXN0b3JlX3N0YXRlKCkgZG9lc24ndCBy
ZXN0b3JlIG1hc3RlciBhbmQgZW5hYmxlPwpIaSBKYWt1YiwKVGhhbmtzIGZvciB0aGUgZmVlZGJh
Y2suIFlvdSBhcmUgY29ycmVjdCwgVGhlIHBjaV9lbmFibGVfZGV2aWNlKCkgYW5kCnBjaV9zZXRf
bWFzdGVyKCkgY2FsbHMgYXJlIG5vdCBuZWNlc3NhcnkuCldlIGRpZCBtb3JlIHRlc3Rpbmcgd2l0
aG91dCB0aGVzZSBjYWxscy4KV2Ugd2lsbCByZW1vdmUgdGhlIGNhbGxzLgpUaGFua3MKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
