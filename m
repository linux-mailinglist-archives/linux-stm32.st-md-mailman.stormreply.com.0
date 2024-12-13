Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D999F01B1
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 02:13:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D2C4C6C83D;
	Fri, 13 Dec 2024 01:13:26 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E28AC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 01:13:19 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5d414b8af7bso2451387a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 17:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734052399; x=1734657199;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=intg7CPV5lNN2upqT1uQ/sZ0DfNdXfMH+V8v11jVfBs=;
 b=jS86awwy3FeeJVhWkX8DNS2EXvxH8PcaMQmX54Sjn78eqV4D05sCb7oy1+LCIC5HP8
 sAV3ZcJcUJBvey3I2hSGpcqUCeAJ/wnpMtwhAfe3gTSWW6nIxk+/xqidGTG40eIjBn+0
 gz9pinl86sRbT/fc7dkN2vGro8RvUDDnX8LyNm7bf4gwKBx21rg+Fvs3g5uaXwic8FpC
 zEzslS1eER+2gL6k4VUD+BnVJgXaJp/gMbrJeUxEEM8ETbxqrvEtt/5BeCkdeeXhFusC
 vAUSgdW70Ue88aT+iOR4jHBorO7Zv7ts6DZ9O7VDTE8k7csMYiX+O+Q4Gav7rrKA+xWc
 neAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734052399; x=1734657199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=intg7CPV5lNN2upqT1uQ/sZ0DfNdXfMH+V8v11jVfBs=;
 b=G9sPOnvfFcQbOfKP7YqRd++cQv1FrOAc6HyYqTLK8a8TbXFUC4N1UDEIUCHa8yIIoe
 ff6Zu6DQruvg24efg11XxcP5H0QjBHV4MVtk3q/OPTqQU8jEg/2OvJHwWUG8XwiI5Fxg
 OHfiBLdlcZtObAlvc+w1gVzCZkP1dLPsG72vJ/j1p4ERBDyQ+V0hxCbZwwPh4aA7VC2o
 M9u33JcRyy+GzO/tcU+gnZJjGPnYgb8K5v0ExvfY/QcEcwT9ZpQkgkY/QWUp4cAq1TRl
 WAOmt3Zf+N3udzRAAFvQFeVtsx7keIzNB1s2ZK3Nhh0bMGxfLmKURrz0Hl9QTknnoWS1
 OrJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5B6e3IiN8EQCD7hVBrF+5RdTfEKISufCKRZFR7JntIrnAFWW6zMHU2CXf+AA3jANrVsyyiXtPBvUQRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwwsLW/2kYYPFxqbq264LS20EzuUsVGIHJ/8wKctN4zzSRehv2e
 Yy0x055Szqog95kXRUhHF/yCVtxIkxQT+3oUJVMCcseju2yewszw+X8eDB0gQmOiZH+DEr1LVS2
 vC3MakQj6v3/MUi0bf2MzLFCsOg4=
X-Gm-Gg: ASbGncuq7T2t6nhogcMclGg5wwr6w86LLxtKxLq88vMIGniBH37keleDD48GRMeoshR
 24bOP0oLTetZbrbM+u66P/8HcAw/mRSEheXAfhGSpIpUyulDhfltNDPzuDCVhzLm0FvsMSw==
X-Google-Smtp-Source: AGHT+IHJz6/L7nDklgKHeOu8YYD2uzG3zcykfx1TYlduVMTtvi/o/gN9R7X66CTA1wTAxqWAB9Av95x4knxXTSW55Os=
X-Received: by 2002:a05:6402:50c9:b0:5d0:d1e0:8fb2 with SMTP id
 4fb4d7f45d1cf-5d63c314efbmr468103a12.11.1734052398528; Thu, 12 Dec 2024
 17:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20241206214315.3385033-1-zmw12306@gmail.com>
 <9830993d-943b-4079-b31d-7c77ee83d306@denx.de>
In-Reply-To: <9830993d-943b-4079-b31d-7c77ee83d306@denx.de>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Thu, 12 Dec 2024 20:13:07 -0500
Message-ID: <CAN4iqtRk4g2q-1c3eTjELeKTTtfcV-MU-_36QkRa76+dsE4y1A@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: peng.fan@nxp.com, make24@iscas.ac.cn, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] pinctrl: stm32: Add check for
	clk_enable()
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

SGkgTWFyZWssCgpPbiBTYXQsIERlYyA3LCAyMDI0IGF0IDc6NTnigK9BTSBNYXJlayBWYXN1dCA8
bWFyZXhAZGVueC5kZT4gd3JvdGU6Cj4KPiBPbiAxMi82LzI0IDEwOjQzIFBNLCBNaW5nd2VpIFpo
ZW5nIHdyb3RlOgo+Cj4gWy4uLl0KPgo+ID4gQEAgLTE2NDYsOCArMTY0NSw4IEBAIGludCBzdG0z
Ml9wY3RsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICAgICAg
ICAgIGlmIChyZXQpIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBmd25vZGVfaGFuZGxlX3B1
dChjaGlsZCk7Cj4gPgo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBw
Y3RsLT5uYmFua3M7IGkrKykKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsa19k
aXNhYmxlX3VucHJlcGFyZShwY3RsLT5iYW5rc1tpXS5jbGspOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGNsa19idWxrX2Rpc2FibGUocGN0bC0+bmJhbmtzLCBwY3RsLT5jbGtzKTsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBjbGtfYnVsa191bnByZXBhcmUocGN0bC0+bmJhbmtzLCBwY3Rs
LT5jbGtzKTsKPgo+IFVzZSBjbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZSgpCj4KPiBpbmNsdWRl
L2xpbnV4L2Nsay5oOnN0YXRpYyBpbmxpbmUgdm9pZCBjbGtfYnVsa19kaXNhYmxlX3VucHJlcGFy
ZShpbnQKPiBudW1fY2xrcywKClRoYW5rcyEgV2UgdXNlZCBjbGtfYnVsa19kaXNhYmxlX3VucHJl
cGFyZSgpIGluIHRoZSBwYXRjaCB2NC4KCkJlc3QsCk1pbmd3ZWkKCj4KPiBJdCBsb29rcyBwcmV0
dHkgZ29vZCBvdGhlcndpc2UsIHRoYW5rcyAhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
