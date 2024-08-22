Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C29AB95B71A
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 15:48:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C33BC7128A;
	Thu, 22 Aug 2024 13:48:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DBC6C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724334480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FjYBhspv7tRST0pSqSmRh821Mv70zB5zctMwrlaK9DI=;
 b=a4raivxHIOCxlHd4d7UGKAv+ITrdQsuCSp4uNXTiz4Lp2QVBHJY8f0G9CdKakUb9jg0HbG
 wxCxfxFytZWZA6KpMoKTxtB24WKY82OEmF3q8tOEeY5Bsd38ru33IFkzGf67IwkFtxm8aP
 c4QoQqmD0OkZV7D4a4UIagWnjPG3qdA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-EtYPsl0jMW-D-4-Dy5H3tg-1; Thu, 22 Aug 2024 09:47:59 -0400
X-MC-Unique: EtYPsl0jMW-D-4-Dy5H3tg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4281310bf7aso6288595e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 06:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724334478; x=1724939278;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FjYBhspv7tRST0pSqSmRh821Mv70zB5zctMwrlaK9DI=;
 b=YtLPZ5brVZEretuCh7IVcok5epnCZiyDcJJ0JBcjElTz80RA4H/yiYClxvK/wnKByV
 Z0mmRHJvOOPhwZCB+tbRhwkawX+usXX661fZEJCKu22oanC1rQ0cmVuZr8OVlrcrnLbN
 5jtGxyGnHAZlue67VPI8WBjbmFabnFrIX4PErSvK8mit+s4mDF+lYWzpwm86HTp9GbjP
 I2/b/ms8aLoF2rmbbDoInJWiqwzIj/XZzYv9CNS4z5P6aimZdREY49nrjwTzKmuTQ8Xf
 TIoiURzK/nl51omTamEMwoQUE0rHbRzUslCIiVuVDUqXKT1mbT2MkRcJPbkrNeYcD0CJ
 Bp+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKmfzbGU64qiM0Vv/fEB4TW+ZmkTslpQRBLTgKBVZhLW5/6DXbnX4H/2C85aEu1BSdmjTyIuAkfmW2+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSaKLibrVfGhT6Wyhvi3MfruB7rRjZK/du5NDjPfQJ5MOhzB/z
 nKUBACrF8jBCh3zEeLsfnptV3e5Lppx4OQzJm4MyevgU1yZE++A3tM7rC3FSGpTe2nnEoOLJEn0
 y41o20PQxh0gJkydwz0BToR1ThkNsT3TGLmnUN73Bhh9k4ccrOTU1aPa1/vo53LsEEF8/P88ZDh
 nLww==
X-Received: by 2002:a05:600c:5014:b0:426:6e95:78d6 with SMTP id
 5b1f17b1804b1-42ac55babf8mr14882755e9.4.1724334478052; 
 Thu, 22 Aug 2024 06:47:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9pgATN30e2cGvgnx/4ylawVQ+wC24Vnwz41hd/vPVumxXeQFsraVN5ewZN1S7fwv2HF76Rg==
X-Received: by 2002:a05:600c:5014:b0:426:6e95:78d6 with SMTP id
 5b1f17b1804b1-42ac55babf8mr14882365e9.4.1724334477513; 
 Thu, 22 Aug 2024 06:47:57 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5162322sm25057215e9.24.2024.08.22.06.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:47:57 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
 Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Stanner <pstanner@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Date: Thu, 22 Aug 2024 15:47:32 +0200
Message-ID: <20240822134744.44919-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/9] PCI: Remove pcim_iounmap_regions()
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

Q2hhbmdlcyBpbiB2MzoKICAtIGZwZ2EvZGZsLXBjaS5jOiByZW1vdmUgbm93IHN1cnBsdXMgd3Jh
cHBlciBhcm91bmQKICAgIHBjaW1faW9tYXBfcmVnaW9uKCkuIChBbmR5KQogIC0gYmxvY2s6IG10
aXAzMnh4OiByZW1vdmUgbm93IHN1cnBsdXMgbGFiZWwuIChBbmR5KQogIC0gdmRwYTogc29saWRy
dW46IEJ1Z2ZpeDogSW5jbHVkZSBmb3Jnb3R0ZW4gcGxhY2Ugd2hlcmUgc3RhY2sgVUIKICAgIG9j
Y3Vycy4gKEFuZHksIENocmlzdG9waGUpCiAgLSBTb21lIG1pbm9yIHdvcmRpbmcgaW1wcm92ZW1l
bnRzIGluIGNvbW1pdCBtZXNzYWdlcy4gKE1lKQoKQ2hhbmdlcyBpbiB2MjoKICAtIEFkZCBhIGZp
eCBmb3IgdGhlIFVCIHN0YWNrIHVzYWdlIGJ1ZyBpbiB2ZGFwL3NvbGlkcnVuLiBTZXBhcmF0ZQog
ICAgcGF0Y2gsIHB1dCBzdGFibGUga2VybmVsIG9uIENDLiAoQ2hyaXN0b3BoZSwgQW5keSkuCiAg
LSBEcm9wIHVubmVjZXNzYXJ5IHBjaW1fcmVsZWFzZV9yZWdpb24oKSBpbiBtdGlwMzJ4eCAoQW5k
eSkKICAtIENvbnNlcXVlbnRseSwgZHJvcCBwYXRjaCAiUENJOiBNYWtlIHBjaW1fcmVsZWFzZV9y
ZWdpb24oKSBhIHB1YmxpYwogICAgZnVuY3Rpb24iLCBzaW5jZSB0aGVyZSdzIG5vIHVzZXIgYW55
bW9yZS4gKG9ic29sZXRlcyB0aGUgc3F1YXNoCiAgICByZXF1ZXN0ZWQgYnkgRGFtaWVuKS4KICAt
IHZkYXAvc29saWRydW46CiAgICDigKIgbWFrZSAnaScgYW4gJ3Vuc2lnbmVkIHNob3J0JyAoQW5k
eSwgbWUpCiAgICDigKIgVXNlICdjb250aW51ZScgdG8gc2ltcGxpZnkgbG9vcCAoQW5keSkKICAg
IOKAoiBSZW1vdmUgbGVmdG92ZXIgYmxhbmsgbGluZQogIC0gQXBwbHkgZ2l2ZW4gUmV2aWV3ZWQt
IC8gYWNrZWQtYnlzIChBbmR5LCBEYW1pZW4sIEJhcnRvc3opCgoKSW1wb3J0YW50IHRoaW5ncyBm
aXJzdDoKVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gWzFdIGFuZCBbMl0gd2hpY2ggQmpvcm4gSGVs
Z2FhcyBoYXMgY3VycmVudGx5CnF1ZXVlZCBmb3IgdjYuMTIgaW4gdGhlIFBDSSB0cmVlLgoKVGhp
cyBzZXJpZXMgc2hhbGwgcmVtb3ZlIHBjaW1faW91bm1hcF9yZWdpb25zKCkgaW4gb3JkZXIgdG8g
bWFrZSB3YXkgdG8KcmVtb3ZlIGl0cyBicm90aGVyLCBwY2ltX2lvbWFwX3JlZ2lvbnMoKS4KCkBC
am9ybjogRmVlbCBmcmVlIHRvIHNxdWFzaCB0aGUgUENJIGNvbW1pdHMuCgpSZWdhcmRzLApQLgoK
WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDcyOTA5MzYyNS4xNzU2MS00LXBz
dGFubmVyQHJlZGhhdC5jb20vClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA4
MDcwODMwMTguODczNC0yLXBzdGFubmVyQHJlZGhhdC5jb20vCgpQaGlsaXBwIFN0YW5uZXIgKDkp
OgogIFBDSTogTWFrZSBwY2ltX2lvdW5tYXBfcmVnaW9uKCkgYSBwdWJsaWMgZnVuY3Rpb24KICBm
cGdhL2RmbC1wY2kuYzogUmVwbGFjZSBkZXByZWNhdGVkIFBDSSBmdW5jdGlvbnMKICBibG9jazog
bXRpcDMyeHg6IFJlcGxhY2UgZGVwcmVjYXRlZCBQQ0kgZnVuY3Rpb25zCiAgZ3BpbzogUmVwbGFj
ZSBkZXByZWNhdGVkIFBDSSBmdW5jdGlvbnMKICBldGhlcm5ldDogY2F2aXVtOiBSZXBsYWNlIGRl
cHJlY2F0ZWQgUENJIGZ1bmN0aW9ucwogIGV0aGVybmV0OiBzdG1pY3JvOiBTaW1wbGlmeSBQQ0kg
ZGV2cmVzIHVzYWdlCiAgdmRwYTogc29saWRydW46IEZpeCBVQiBidWcgd2l0aCBkZXZyZXMKICB2
ZGFwOiBzb2xpZHJ1bjogUmVwbGFjZSBkZXByZWNhdGVkIFBDSSBmdW5jdGlvbnMKICBQQ0k6IFJl
bW92ZSBwY2ltX2lvdW5tYXBfcmVnaW9ucygpCgogLi4uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVs
L2RldnJlcy5yc3QgICAgICAgIHwgIDEgLQogZHJpdmVycy9ibG9jay9tdGlwMzJ4eC9tdGlwMzJ4
eC5jICAgICAgICAgICAgIHwgMTYgKysrLS0tCiBkcml2ZXJzL2ZwZ2EvZGZsLXBjaS5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxNiArKy0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1lcnJpZmll
bGQuYyAgICAgICAgICAgICAgICB8IDE0ICsrLS0tCiAuLi4vbmV0L2V0aGVybmV0L2Nhdml1bS9j
b21tb24vY2F2aXVtX3B0cC5jICAgfCAxMCArKy0tCiAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtbG9vbmdzb24uYyAgfCAyNSArKy0tLS0tLQogLi4uL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9zdG1tYWNfcGNpLmMgIHwgMTggKystLS0tCiBkcml2ZXJzL3BjaS9kZXZyZXMu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyNCArLS0tLS0tLQogZHJpdmVycy92ZHBhL3Nv
bGlkcnVuL3NuZXRfbWFpbi5jICAgICAgICAgICAgIHwgNTcgKysrKysrKystLS0tLS0tLS0tLQog
aW5jbHVkZS9saW51eC9wY2kuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDEw
IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDEyMiBkZWxldGlvbnMoLSkKCi0tIAoy
LjQ2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
