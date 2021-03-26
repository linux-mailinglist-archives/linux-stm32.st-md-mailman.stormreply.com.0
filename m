Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7415234A991
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 15:22:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AAE0C5718F;
	Fri, 26 Mar 2021 14:22:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA140C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 14:22:20 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v4so5787325wrp.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jPrss6MgeIvEfu+cUNSjrJCOpcljezeh6+dDf7NPDa0=;
 b=NjVCbBdVhpCtF7cQoLz45keDeqicZaSTkXDP951der0x2QQYIp9fHHev6kcunhfpz6
 bUdkTdaiPd2oW5CwM83DHOv6FmDQCUbkZxXVzeOz3Qrd/FjNADrDk6oRM7POjoYXOPTT
 x7PNhS1oVP1P3xCW6vYeVjOCO7CA7bbiNY9Ik38D3mcwW9SCYHoqci7628F8tm57vSmm
 VO+NUhBWAh9mib0vaqb2FCXCjHfWhxHX0b8FhNx8eIMBdoF78kQ7/f3pD2QO8ovWqMwx
 uAAUplq3CihgzTk3bAjsK6w9XUzDrtieZd7xiYqxupACowD34HMzX3HWc0fo9RnjanJc
 elYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jPrss6MgeIvEfu+cUNSjrJCOpcljezeh6+dDf7NPDa0=;
 b=uCefH+6nCZKpwmRBOyif6UD1Sk9dOxhTHIsIZAQyn2D3eqkG5mBa7P9CwazjAxMZoS
 rjxDFRIMtNlzJXKbS0nRX3FDpXEbXmUVM8clYDUS6tO+Lb6kmZXUJCuaRkI1+VP+7Vgx
 6NXJM7Q59N9n+T6E91NOCJiGbvcRI+We4Y35M+LgoPP2L2CYm6yu143iG7eUEkpugax4
 1Tkve/wgJuvJI60sj8nW/S3oE9eg470uQRIVm5LbpxR04kkNQfm+nD1iwlyEiEFuMPie
 yiK6kFwzRR178Vup3A+vm08eDlNKarbOeYTxSEyCUbXscxESNIVw8Xs+msJWcvsysexV
 1xFA==
X-Gm-Message-State: AOAM530wvCRlGcdNAEtnXOCqBnAanpD1US+AevHgnIyWd1xtMNSM4W6h
 MLC/K9foXW2HAwjWUyLP5+GJFg==
X-Google-Smtp-Source: ABdhPJwZ8BOpa2TGeYwtefzDJ+tZQkFdJIoEeZ72w1wchMYOQ50a7VJGaZoN4pp7Dmug5Uv1b+VT2A==
X-Received: by 2002:adf:d207:: with SMTP id j7mr14783922wrh.150.1616768540289; 
 Fri, 26 Mar 2021 07:22:20 -0700 (PDT)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id f16sm12744884wrt.21.2021.03.26.07.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:22:19 -0700 (PDT)
Date: Fri, 26 Mar 2021 14:22:17 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20210326142217.GA2916463@dell>
References: <20210324173404.66340-1-lee.jones@linaro.org>
 <20210326114202.3862b8c5@jic23-huawei>
 <20210326142041.GZ2916463@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326142041.GZ2916463@dell>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Zhang Lixu <lixu.zhang@intel.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Anssi Hannula <anssi.hannula@gmail.com>,
 Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Henrik Rydberg <rydberg@bitmath.org>,
 Lopez Casado <nlopezcasad@logitech.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Masaki Ota <masaki.ota@jp.alps.com>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Vojtech Pavlik <vojtech@suse.cz>, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 message to <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, "L. Vinyard,
 Jr" <rvinyard@cs.nmsu.edu>, linaro-mm-sig@lists.linaro.org,
 Michael Haboustak <mike-@cinci.rr.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Drubin <daniel.drubin@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Linux-stm32] [PATCH 00/25] Rid W=1 warnings from HID
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

T24gRnJpLCAyNiBNYXIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBGcmksIDI2IE1hciAy
MDIxLCBKb25hdGhhbiBDYW1lcm9uIHdyb3RlOgo+IAo+ID4gT24gV2VkLCAyNCBNYXIgMjAyMSAx
NzozMzozOSArMDAwMAo+ID4gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGU6
Cj4gPiAKPiA+ID4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGlu
ZyB0byBjbGVhbi11cCBXPTEKPiA+ID4ga2VybmVsIGJ1aWxkcywgd2hpY2ggYXJlIGN1cnJlbnRs
eSBvdmVyd2hlbG1pbmdseSByaWRkbGVkIHdpdGgKPiA+ID4gbmlnZ2x5IGxpdHRsZSB3YXJuaW5n
cy4KPiA+IAo+ID4gTGVlLCBpdCdzIGEgYml0IG5vdmVsIHRvIGNjIGxpbnV4LWlpbyBvbiB0aGUg
Y292ZXIgbGV0dGVyIGJ1dAo+ID4gbm9uZSBvZiB0aGUgYWN0dWFsIHBhdGNoZXMuLiAgT3IgbGVh
c3Qgbm9uZSBvZiB0aGVtIHJlYWNoZWQKPiA+IG1lIG9yIGxvcmUua2VybmVsLm9yZwo+IAo+IExv
b2tzIGxpa2Ugb25seSAxOCBvZiB0aGUgMjUgYWN0dWFsbHkgbWFkZSBpdCBvbnRvIHRoZSBsaXN0
Lgo+IAo+IEhvdyBvZGQhCgpPdWNoISAgVGhhdCdzIHdoeSB0aGVuOgoKICA0LjMuMCBUZW1wb3Jh
cnkgU3lzdGVtIFByb2JsZW0uICBUcnkgYWdhaW4gbGF0ZXIgKDEwKS4gcDE5c20xNDY2MzY3ZWRy
LjU3IC0gZ3NtdHAKCj4gSG9sZCBvbiwgSSdsbCBzdWJtaXQgYSBbUkVTRU5EXS4KPiAKPiA+IEkn
bSBzdXJlIHRoZXkgYXJlIGdyZWF0IDopCj4gCj4gTmF0dXJhbGx5IQo+IAoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
