Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6096A34A979
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 15:20:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA23C5718D;
	Fri, 26 Mar 2021 14:20:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91831C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 14:20:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so5002913wmd.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 07:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6xcgNGeiKXVzTZo3oILiZykt3w8GnNqVy7yzUHjFBQQ=;
 b=XeWeBn8WX5c+uJ8CnM+CQZtmzh/4bB4qoMOD512ejsGsAJhBMpIRE45WmKhdf2TLqx
 MiQ6KDk6/7dK5bC7/+YYWLHrtI06Ylrvmd6twooQS+XegMtZPl4Yf+uUHzXSdofzs0cp
 bvHUTHcKSdaDDHV+Y53fP3oLBS8LcoFCOQn4l1FbEJucpwut9t3dciREPiwQSF0ZQKKQ
 Ee1jr+vVwrB3+iekJsvmKwpu8RuaJaotHb+gkCtGTJOoxCEV/+4RHUazLmcluVA1pSht
 YojJg8tbVnIbRSxGQoaeSJBznKPSXq3Clwm4mlT+W4SXXom4TtpEkaUJ2pRM4TzCKw5Z
 FVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6xcgNGeiKXVzTZo3oILiZykt3w8GnNqVy7yzUHjFBQQ=;
 b=TyKKAkljGjErdNJ02iDyn7F1yf4JmriIc7XOipRCCYxgi782ha9ZX7dejzQT9qA8Sf
 MuD8c9fZHJS7tDgKEH3uNe0X/p3wrZNLZV5S96jxKx2WLu0qkROIR6G9UH28wQp23Gpj
 Lzj7anUBiTy4Fm/U+6mR6ii6YxPtjOvV0q6UfeTuVFuLhtYMwEChoOj+5x5r14HRBav+
 2K7d9wsctE7TxVY+/BlhxlnElhAAjHWyZnHJA5QdoI85exj+2yeImX1N60iSQIA2UhmG
 B8WXsSnP/Iiqo1jmxBGR2weROP6KmUry+c++GY9w+8whPTzHjajlbghNLYdixiDKdBd+
 yseQ==
X-Gm-Message-State: AOAM53207cLRjKSn2Upt16xhGH6RXP/J+U18pzqxcAgLcPpC8PYobPRu
 jMkXp2pDFYSYGaGqODII8IoiAg==
X-Google-Smtp-Source: ABdhPJzCoDvRJ0yro1yeYdy8gIdvQTImgu841Bp+OkX3kL6D2LJpK0xk7inIx+W3Fy7Q3UcDJTIu1w==
X-Received: by 2002:a05:600c:378c:: with SMTP id
 o12mr13377556wmr.69.1616768446113; 
 Fri, 26 Mar 2021 07:20:46 -0700 (PDT)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id e8sm11125675wme.14.2021.03.26.07.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:20:45 -0700 (PDT)
Date: Fri, 26 Mar 2021 14:20:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20210326142041.GZ2916463@dell>
References: <20210324173404.66340-1-lee.jones@linaro.org>
 <20210326114202.3862b8c5@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326114202.3862b8c5@jic23-huawei>
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

T24gRnJpLCAyNiBNYXIgMjAyMSwgSm9uYXRoYW4gQ2FtZXJvbiB3cm90ZToKCj4gT24gV2VkLCAy
NCBNYXIgMjAyMSAxNzozMzozOSArMDAwMAo+IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+IHdyb3RlOgo+IAo+ID4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0
ZW1wdGluZyB0byBjbGVhbi11cCBXPTEKPiA+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJy
ZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPiBuaWdnbHkgbGl0dGxlIHdhcm5p
bmdzLgo+IAo+IExlZSwgaXQncyBhIGJpdCBub3ZlbCB0byBjYyBsaW51eC1paW8gb24gdGhlIGNv
dmVyIGxldHRlciBidXQKPiBub25lIG9mIHRoZSBhY3R1YWwgcGF0Y2hlcy4uICBPciBsZWFzdCBu
b25lIG9mIHRoZW0gcmVhY2hlZAo+IG1lIG9yIGxvcmUua2VybmVsLm9yZwoKTG9va3MgbGlrZSBv
bmx5IDE4IG9mIHRoZSAyNSBhY3R1YWxseSBtYWRlIGl0IG9udG8gdGhlIGxpc3QuCgpIb3cgb2Rk
IQoKSG9sZCBvbiwgSSdsbCBzdWJtaXQgYSBbUkVTRU5EXS4KCj4gSSdtIHN1cmUgdGhleSBhcmUg
Z3JlYXQgOikKCk5hdHVyYWxseSEKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
