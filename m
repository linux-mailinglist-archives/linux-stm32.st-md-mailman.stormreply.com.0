Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 653489486A4
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 02:36:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6F36C71290;
	Tue,  6 Aug 2024 00:36:49 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43AE2C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 00:36:43 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2caff99b1c9so32983a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2024 17:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722904602; x=1723509402;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pplKHmr8EQUNWlMcxLWDiYQCbu1qDuf1WOvlJRSkiA=;
 b=I6BsUTROsDG/OFRHXtFr7HmoR2QwEk1KQVa/nqDtBvMYRiGvxj7/8pF5YaWdcLb+ep
 sj8qw7Xsv7Yncl1eR6o2LRkF2YLaW+aGNJDcIYQ9hjP2a7vSgbqeMDkCOLbP6p1x5M2U
 hSGztyl8i96wObywZWUdJDNY4i0E5AQ2hKmfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722904602; x=1723509402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pplKHmr8EQUNWlMcxLWDiYQCbu1qDuf1WOvlJRSkiA=;
 b=XUqsZ5X97lAFUufCDAzmMBuHyTpm7jKYcnISam5O+PcA6Os4OHEW94pRMlFVKvzI0L
 kN4taNsNZOHQR+dLY/3/V1JsSRydX9Uh0WxvfQNGpxjcsD6a1eBbK1mkjrVpB4PAD0nt
 Pk0pbGUihrbl9XTSLhSxNwgM8esUvsn5QjclbQSjl1pBhD/ZVSFwBFnORb90CKP6YQKQ
 nZu9+nWlhnekElHK/k8eqPmqFa1ZIO7WL/m+8+gSgDZnSWwE0RsRzIbGwWtyZOOLx6+n
 lYqiqZbRDGuk0DbPU/7wW3c8jQehunivULxA/v/nInb6zi5Ng0WMXeIeg10s0MYmNHDl
 ohuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRcTpygjgKTLRd3W6Ba42NpWMBZo2AbgDQN/eh/IYCdKFaWTJzE1EHBzxoeYybw8Yjtf0TIWTXcywuDXYiwDpsqoNQpVT0KofBEFWCtEMwsp1njEDItln0
X-Gm-Message-State: AOJu0YwVLLzzGdS1LCyKpWnBjMZWmcqPsOXTXGNN6KhPAaB+AsWMsRqH
 eJOQmRZDwsjyK6R0OPHGJQwQMeGZooIaOpK14bSlff+kLLL3ROpQICtJ8ZO1nLwjWknVVhAt3CA
 ssASdzzswyvyZUT/ap9eo9boyAfrjjBpXQW1cR4YsTSqss1qW3wig
X-Google-Smtp-Source: AGHT+IHB9BEhSWGe9GLNuS6Dm7ZTZZe2UpxioIrIh4RcepSEQAn5YPOgfkAxaCARqqd+KnKQ1tppT5pDOwojFV3vL6o=
X-Received: by 2002:a17:90b:3643:b0:2cf:ce3a:4fef with SMTP id
 98e67ed59e1d1-2cff9445836mr12346878a91.19.1722904601682; Mon, 05 Aug 2024
 17:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
 <1e6e6eaa-3fd3-4820-bc1d-b1c722610e2f@lunn.ch>
In-Reply-To: <1e6e6eaa-3fd3-4820-bc1d-b1c722610e2f@lunn.ch>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 5 Aug 2024 17:36:30 -0700
Message-ID: <CAMdnO-J-G2mUw=RySEMSUj8QmY7CyFe=Si1-Ez9PAuF+knygWQ@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: Integrate
 dwxgmac4 into stmmac hwif handling
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

SGkgQW5kcmV3LApPbiBGcmksIEF1ZyAyLCAyMDI0IGF0IDM6NTnigK9QTSBBbmRyZXcgTHVubiA8
YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+Cj4gPiArICAgICB1c2VyX3ZlciA9IHN0bW1hY19nZXRf
dXNlcl92ZXJzaW9uKHByaXYsIEdNQUM0X1ZFUlNJT04pOwo+ID4gKyAgICAgaWYgKHByaXYtPnN5
bm9wc3lzX2lkID09IERXWEdNQUNfQ09SRV80XzAwICYmCj4gPiArICAgICAgICAgdXNlcl92ZXIg
PT0gRFdYR01BQ19VU0VSX1ZFUl9YMjIpCj4gPiArICAgICAgICAgICAgIG1hYy0+ZG1hID0gJmR3
eGdtYWM0MDBfZG1hX29wczsKPgo+IEkga25vdyBub3RoaW5nIGFib3V0IHRoaXMgaGFyZHdhcmUu
Li4uCj4KPiBEb2VzIHByaXYtPnN5bm9wc3lzX2lkID09IERXWEdNQUNfQ09SRV80XzAgbm90IGlt
cGx5Cj4gZHd4Z21hYzQwMF9kbWFfb3BzPwo+Cj4gQ291bGQgYSB1c2VyIHN5bnRoZXNpc2UgRFdY
R01BQ19DT1JFXzRfMDAgd2l0aG91dCB1c2luZwo+IGR3eGdtYWM0MDBfZG1hX29wcz8gQ291bGQg
ZHd4Z21hYzUwMF9kbWFfb3BzIG9yIGR3eGdtYWMxMDBfZG1hX29wcyBiZQo+IHVzZWQ/Clllcywg
dGhlIHVzZXIgY2FuIGNob29zZSBiZXR3ZWVuIEVuaGFuY2VkIERNQSAsIEh5cGVyIERNQSAsIE5v
cm1hbCBETUEuClRoaXMgU29DIHN1cHBvcnQgaGFzIGNob3NlbiBIeXBlciBETUEgZm9yIGZ1dHVy
ZSBleHBhbmRhYmlsaXR5LgoKPgo+ICAgICAgICAgQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
