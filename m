Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6671785168
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 09:23:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 753C1C6B44E;
	Wed, 23 Aug 2023 07:23:08 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C492C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 23:05:17 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso664112466b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 16:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692745517; x=1693350317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tl1tPAJsY+6HeQIjw/xN1e5yMc1WTSncxxsEvTVmB8M=;
 b=J3AHJmH5FH5EWYJY8LWPuAdZqR9BdWQ9dx2Mj9W8vbp91TJ1UXiMgOCaUxI2aniiPB
 f1leJ9g1sr121JreOI3n55cXPjQ7zA4o+tr/7Xj74XSjU5xhQVWLAfv65/vuYbr+kS+Q
 /ovh7L4fXD1jtqk7udukzQ4S+YSX4HiRJ6H32pFUdajFJgi8zouIDKUDCUd8weXZcFy5
 ZQdQmjTtG2icVUMVYzlmKfRIHEZx+3QyGoKxKz9zH+LFSEbggDHgyj35mT8loDz5Q5Ms
 keThPZVmZN3bIb4H+MsLBJ3MXYDN+EbaYcEO8+DwlnB7dfUrh5WDAO80g84MD1k1IB9r
 87Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692745517; x=1693350317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tl1tPAJsY+6HeQIjw/xN1e5yMc1WTSncxxsEvTVmB8M=;
 b=gpvUYKEErhMSyfuFLdpXYG4tTyNEV7ZMhqAv6tVgxK+LD0g4bWFVnIwbtoBYuzHeTk
 oUlHTl5AhpiYx7NTnLCJ9sFHy9i+5Lv9e8SCLvRmMjwGum7ToLtgw2wdhZc25De5FvP9
 jwBJ2l3Er67ESLER8oN+LVoYg14JdKltPHWrW6qtgj/Fw43bLY8bjeaHh54gcd1KKTY9
 KNwh6rdkNqLKUOpJN5edzDeEWmiJLEv3mfkr9mTJJQUAc8UPjtqy6BQJZB6bWbgk90UU
 RLYQzLhhdFTqDpdmdcaOVQC91ehqAiFV0g3xlOsMqclM6vQTLgnZz6kzG9WzaFwewpvm
 JPUg==
X-Gm-Message-State: AOJu0YzqkctZ9ZfQOdV+BmzUifjOU39myJVoKrRODdSi39CHVD7ecZjN
 q2C5fepueJbRKKlFUt6A2x0rzmRgzYAw9xCPTrc=
X-Google-Smtp-Source: AGHT+IGc4vnfO5SO2rv82RsYq+TW7/uByZDfWyswWgwX0GX8iv3xt75IkRdZmjAU5aKwi0tBJtJFC8zrCiSUE6S0eJg=
X-Received: by 2002:a17:906:535d:b0:98e:f13:e908 with SMTP id
 j29-20020a170906535d00b0098e0f13e908mr9494142ejo.60.1692745517251; Tue, 22
 Aug 2023 16:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174702.4059100-1-robh@kernel.org>
In-Reply-To: <20230714174702.4059100-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 22 Aug 2023 18:05:06 -0500
Message-ID: <CABb+yY0ZEkU2fEoFcihDM0GPuNBkCJHYXfkq-+bLJY1xtbf5Jw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Wed, 23 Aug 2023 07:23:07 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Orson Zhai <orsonzhai@gmail.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] mailbox: Explicitly include correct DT
	includes
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTI6NDfigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFRoZSBEVCBvZl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBk
YXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0
IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiBBcyBwYXJ0IG9mIHRo
YXQgbWVyZ2UgcHJlcHBpbmcgQXJtIERUIHN1cHBvcnQgMTMgeWVhcnMgYWdvLCB0aGV5Cj4gInRl
bXBvcmFyaWx5IiBpbmNsdWRlIGVhY2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3Jt
X2RldmljZS5oCj4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdzIGEgcHJldHR5IG11Y2gg
cmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gZmlsZXMgdXNlZCB0aHJvdWdob3V0IHRoZSB0
cmVlLiBJbiBvcmRlciB0byBkZXRhbmdsZSB0aGVzZSBoZWFkZXJzIGFuZAo+IHJlcGxhY2UgdGhl
IGltcGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0
bwo+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVjdCBpbmNsdWRlcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4KSSB0aG91Z2h0IEkgd2FzIHRv
IHBpY2sgdGhlIHBhdGNoLiBCdXQgSSBzZWUgeW91IGludGVuZCB0byBkbyBpdC4gTnAuCgpBY2tl
ZC1ieTogSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPgoKdGhhbmtzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
