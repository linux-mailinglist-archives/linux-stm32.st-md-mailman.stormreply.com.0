Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A7B1685F
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 23:44:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79A4DC3089E;
	Wed, 30 Jul 2025 21:44:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48EBEC3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 21:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753911895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
 b=NefG+6+AoB+nFdpZ+Mvu2NIzuXZlagaCp//jX+1tbnrdjPncw7v6yX2nAiBAio1zkx6niJ
 gUHhSY3aAFEOzAafEwReh8wVfBbiY6PRCmjRy2pqoIkoRfBRl6CzHHeh/74hcaFFuKN+Lj
 YirNP4/+yqXVhT4auVKrq63d+e1PXqY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-tlRrwBy5MMyOqDYHGzcrTQ-1; Wed, 30 Jul 2025 17:44:54 -0400
X-MC-Unique: tlRrwBy5MMyOqDYHGzcrTQ-1
X-Mimecast-MFC-AGG-ID: tlRrwBy5MMyOqDYHGzcrTQ_1753911893
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-af911fc1751so21386466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 14:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753911893; x=1754516693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
 b=RTw8Zl8+WPXshLL6EAFXZrZ4WswlGOhNWWSpVlmjLuH54zLnNarKkR5I5k6qp2DzQi
 /EJ8aSDrubP8mjpffkk7PY6Ttr1jFVBZqIz5tHC6hdwfE4kDja32XM41VLeH1I6JLMEq
 YTVXP2V0nQznIOhJMp/PBZ+yZqHHi3Do2X4wl9nkjGys3OcGgNN21LDo+FNkjUSNr3LY
 /0FEEHvDHz+ZvN++lNVxP3mKCfSJAn2SQAcK4OBAKFCX+inBzjV0Tf1DF2GYDKq8ZGV8
 Bgxa0NUNW33wtrFOURNG8UvoR/B147oqJEVKWwl6qAAtapa5BbZUyEh+r28kixz17RsZ
 WG1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2ZFfrCyRqtkmtwVN8REec9vdoPGhTHkucNm6ngXsmQoR7CGoW4Q2KJzpgKkeUyoY+OutriN26zaAK/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzHlFW3RfPur+YMD4Y/wfQkxs5wEcEbqwHgBbEQLulNhXuR8GAS
 wRymNG4kD69FT4uzwDrAUTakbWAH4a1ihEe09fnWB+ZJxdvQTTckKZYWqADXdKeOxlnQvJCwj0B
 cWI6Rtk9BP8M9AukG3ytyqe68b9JKx/FshxNO+CILGA/LBvHqwRnwzYekJiCm415HRfFihu7WXn
 z4CeOxFXCpJNKy3bygWpZtRG6/L64VPYN+n9Dq91ZtWPmAB9/yW/6NHYs+
X-Gm-Gg: ASbGnctRubdURt7tJzUYeEN9NuV5dNnb75w5VpZ7c8Y0mnsGkATEBf9uv5g+0u/BtGc
 pNKcYQFhBr5OXUDCOxkPTA715q4kJAfXzUSO7d+8Qmdxw2w12/EnYWx8mVZyE1dOC5cIpmGqOBy
 IKrEqQvJ09h65Qbj3lcDx1
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id
 a640c23a62f3a-af8fd95983cmr588747266b.28.1753911892799; 
 Wed, 30 Jul 2025 14:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETx/Q8z8JkM7YCT5hwYxMVdj/tg+Mt8q7qzSVGG/eKji/F1PzdcrMN7TdxkQSZqczHP8nko8qLTPufvPgLTYo=
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id
 a640c23a62f3a-af8fd95983cmr588742766b.28.1753911892317; Wed, 30 Jul 2025
 14:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
 <20250711-adorable-winged-petrel-3a55df@houat>
In-Reply-To: <20250711-adorable-winged-petrel-3a55df@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 30 Jul 2025 17:44:40 -0400
X-Gm-Features: Ac12FXzMGo-MKds2pkAwVkvrlMlbQL40TOGBvmpmqZ_c-U-gdfMUVGNxYave4ac
Message-ID: <CABx5tqKuOcE83t+BVz=1WudVtBxJYTzcjWJ_n4se0JQWeU_Y1w@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n-TrfewD-mjwLmY0DEMwrzdoItzEy7u3JweRLp9ViC0_1753911893
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert
 from round_rate() to determine_rate()
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

T24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgMzowNeKAr0FNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMDE6NDM6MTBQTSAt
MDQwMCwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+ID4gLXN0YXRpYyBsb25nIHN1bjRpX2RjbGtfcm91
bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpwYXJlbnRfcmF0ZSkKPiA+
ICtzdGF0aWMgaW50IHN1bjRpX2RjbGtfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGtfcmF0ZV9y
ZXF1ZXN0ICpyZXEpCj4gPiAgewo+ID4gICAgICAgc3RydWN0IHN1bjRpX2RjbGsgKmRjbGsgPSBo
d190b19kY2xrKGh3KTsKPiA+ICAgICAgIHN0cnVjdCBzdW40aV90Y29uICp0Y29uID0gZGNsay0+
dGNvbjsKPiA+IEBAIC03Nyw3ICs3Nyw3IEBAIHN0YXRpYyBsb25nIHN1bjRpX2RjbGtfcm91bmRf
cmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAo+ID4gICAgICAgaW50
IGk7Cj4gPgo+ID4gICAgICAgZm9yIChpID0gdGNvbi0+ZGNsa19taW5fZGl2OyBpIDw9IHRjb24t
PmRjbGtfbWF4X2RpdjsgaSsrKSB7Cj4gPiAtICAgICAgICAgICAgIHU2NCBpZGVhbCA9ICh1NjQp
cmF0ZSAqIGk7Cj4gPiArICAgICAgICAgICAgIHU2NCBpZGVhbCA9ICh1NjQpIHJlcS0+cmF0ZSAq
IGk7Cj4KPiBUaGVyZSBzaG91bGRuJ3QgYmUgYW55IHNwYWNlIGFmdGVyIHRoZSBjYXN0Lgo+Cj4g
T25jZSBmaXhlZCwKPiBBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3Jn
PgoKT0suIEknbSBwbGFubmluZyB0byBzdWJtaXQgYSB2MiBvZiB0aGlzIHNlcmllcyBvbiBBdWd1
c3QgMTF0aCB3aGVuCnY2LjE3cmMxIGlzIG91dC4gVW5sZXNzIHRoZSBtYWludGFpbmVyIHRoYXQg
cGlja3MgdXAgdGhpcyB3aG9sZSBzZXJpZXMKcGxhbnMgdG8gZHJvcCB0aGUgc3BhY2Ugb24gbWVy
Z2UuCgpCcmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
