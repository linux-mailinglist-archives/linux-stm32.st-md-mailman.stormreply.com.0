Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EBC959595
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 09:19:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB3EFC71287;
	Wed, 21 Aug 2024 07:19:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 234A3C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724224744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=knoOMJx067NkrODyMR3q3Y02Ir50QCnNCyZ9+YE+nPg=;
 b=HUz2DHT7Z7GbCAeBoxSM8z/VN2UvpHUeKFpZz3C+1V/Jfi1x3Ikg6jJV+MIjVE5nMJbSPq
 qMzbpPnksFoOrrY/mAJQ8No/4fuRS80edu+a35Zf1TY+LPy2L2fvyG4TLDsEDR/+1LZ+YX
 osWdmBNtx1m8mWwBzwcwMr/qIZTlTRw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-Musfg4_DNj6EIgz6pCiemg-1; Wed, 21 Aug 2024 03:19:00 -0400
X-MC-Unique: Musfg4_DNj6EIgz6pCiemg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7a1d7344c81so672195285a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 00:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724224740; x=1724829540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=knoOMJx067NkrODyMR3q3Y02Ir50QCnNCyZ9+YE+nPg=;
 b=twDAns+C7xbCGRBnbGuMtCZF6aS3rCbT+0Uo2Pg0708GoA9EvYFzQfuxAcaFKI1DN4
 hYLa6F266UfLevMoec7ezTCNT3NcdVfQ4q1Q5J7nwD65q3+/cHHkTLRw+c0C5RThL2ia
 /I0alRlODMuyrFFTBAZfjRn9NyC7z7x+h/gsJr79V4+N7AnJu0Pgq0zzzgW7XlNC3Wcq
 Qi7R5fNjHMJzxmcsgc0nMMCd3FvVLRd39Q86C+vHKjsuqbQS2uY844Q9b28TcarCccIS
 zW/+i7wGkE17FebxqSpR0vGl8fduh9xyAPPNQNPJfblzFiW3SOFBeXPHHs+pwDYvfOH7
 ux0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHKzPJr352b7zPJikWLzg+B0G4Ial5qKbJZMTXihteWM0j198i110+j5Feg3QnSGIFwGqA2wqyigf7gg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwMeEww2cZNwiSOSyiPdllA6gXwB779u/LDpSOLeMuYGmazlD1B
 pLgqVI6Yj003SknfyBu0+62yVTSEgDcf4g9H1ifl2Ys7FC47Kdnhgr05JveAOBwfTENVNC46Kn7
 6iDEosKZ5uHmTbvKf23bGhxMmIbFJkuhX04g0uRSmKsqX8uY1o8z7rPgs0rNSFaJQ6ZEdCpp38K
 6qog==
X-Received: by 2002:a05:620a:462c:b0:79d:759d:4016 with SMTP id
 af79cd13be357-7a673ffb26bmr218727685a.11.1724224739706; 
 Wed, 21 Aug 2024 00:18:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw1qO6+vz/sJKGh5yA34l/Px9L622Vwet6ke86rxp1KDhRugQHSlyN6hevOfH4OkiWcMWOug==
X-Received: by 2002:a05:620a:462c:b0:79d:759d:4016 with SMTP id
 af79cd13be357-7a673ffb26bmr218721785a.11.1724224739226; 
 Wed, 21 Aug 2024 00:18:59 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 00:18:58 -0700 (PDT)
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
 Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>
Date: Wed, 21 Aug 2024 09:18:33 +0200
Message-ID: <20240821071842.8591-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/9] PCI: Remove pcim_iounmap_regions()
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

Q2hhbmdlcyBpbiB2MjoKICAtIEFkZCBhIGZpeCBmb3IgdGhlIFVCIHN0YWNrIHVzYWdlIGJ1ZyBp
biB2ZGFwL3NvbGlkcnVuLiBTZXBhcmF0ZQogICAgcGF0Y2gsIHB1dCBzdGFibGUga2VybmVsIG9u
IENDLiAoQ2hyaXN0b3BoZSwgQW5keSkuCiAgLSBEcm9wIHVubmVjZXNzYXJ5IHBjaW1fcmVsZWFz
ZV9yZWdpb24oKSBpbiBtdGlwMzJ4eCAoQW5keSkKICAtIENvbnNlcXVlbnRseSwgZHJvcCBwYXRj
aCAiUENJOiBNYWtlIHBjaW1fcmVsZWFzZV9yZWdpb24oKSBhIHB1YmxpYwogICAgZnVuY3Rpb24i
LCBzaW5jZSB0aGVyZSdzIG5vIHVzZXIgYW55bW9yZS4gKG9ic29sZXRlcyB0aGUgc3F1YXNoCiAg
ICByZXF1ZXN0ZWQgYnkgRGFtaWVuKS4KICAtIEZpeCBidWcgaW4gcGF0Y2ggImJsb2NrOiBtdGlw
MzJ4eCAuLi4iIHdoZXJlIGFjY2lkZW50YWxseSBCQVIgMQogICAgaW5zdGVhZCBvZiBNVElQX0FC
QVIgd2FzIHJlcXVlc3RlZC4KICAtIHZkYXAvc29saWRydW46CiAgICDigKIgbWFrZSAnaScgYW4g
J3Vuc2lnbmVkIHNob3J0JyAoQW5keSwgbWUpCiAgICDigKIgVXNlICdjb250aW51ZScgdG8gc2lt
cGxpZnkgbG9vcCAoQW5keSkKICAgIOKAoiBSZW1vdmUgbGVmdG92ZXIgYmxhbmsgbGluZQogIC0g
QXBwbHkgZ2l2ZW4gUmV2aWV3ZWQtIC8gYWNrZWQtYnlzIChBbmR5LCBEYW1pZW4sIEJhcnRvc3op
CgoKSW1wb3J0YW50IHRoaW5ncyBmaXJzdDoKVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gWzFdIGFu
ZCBbMl0gd2hpY2ggQmpvcm4gSGVsZ2FhcyBoYXMgY3VycmVudGx5CnF1ZXVlZCBmb3IgdjYuMTIg
aW4gdGhlIFBDSSB0cmVlLgoKVGhpcyBzZXJpZXMgc2hhbGwgcmVtb3ZlIHBjaW1faW91bm1hcF9y
ZWdpb25zKCkgaW4gb3JkZXIgdG8gbWFrZSB3YXkgdG8KcmVtb3ZlIGl0cyBicm90aGVyLCBwY2lt
X2lvbWFwX3JlZ2lvbnMoKS4KCkBCam9ybjogRmVlbCBmcmVlIHRvIHNxdWFzaCB0aGUgUENJIGNv
bW1pdHMuCgpSZWdhcmRzLApQLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0
MDcyOTA5MzYyNS4xNzU2MS00LXBzdGFubmVyQHJlZGhhdC5jb20vClsyXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNDA4MDcwODMwMTguODczNC0yLXBzdGFubmVyQHJlZGhhdC5jb20v
CgpQaGlsaXBwIFN0YW5uZXIgKDkpOgogIFBDSTogTWFrZSBwY2ltX2lvdW5tYXBfcmVnaW9uKCkg
YSBwdWJsaWMgZnVuY3Rpb24KICBmcGdhL2RmbC1wY2kuYzogUmVwbGFjZSBkZXByZWNhdGVkIFBD
SSBmdW5jdGlvbnMKICBibG9jazogbXRpcDMyeHg6IFJlcGxhY2UgZGVwcmVjYXRlZCBQQ0kgZnVu
Y3Rpb25zCiAgZ3BpbzogUmVwbGFjZSBkZXByZWNhdGVkIFBDSSBmdW5jdGlvbnMKICBldGhlcm5l
dDogY2F2aXVtOiBSZXBsYWNlIGRlcHJlY2F0ZWQgUENJIGZ1bmN0aW9ucwogIGV0aGVybmV0OiBz
dG1pY3JvOiBTaW1wbGlmeSBQQ0kgZGV2cmVzIHVzYWdlCiAgdmRwYTogc29saWRydW46IEZpeCBw
b3RlbnRpYWwgVUIgYnVnIHdpdGggZGV2cmVzCiAgdmRhcDogc29saWRydW46IFJlcGxhY2UgZGVw
cmVjYXRlZCBQQ0kgZnVuY3Rpb25zCiAgUENJOiBSZW1vdmUgcGNpbV9pb3VubWFwX3JlZ2lvbnMo
KQoKIC4uLi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9kZXZyZXMucnN0ICAgICAgICB8ICAxIC0K
IGRyaXZlcnMvYmxvY2svbXRpcDMyeHgvbXRpcDMyeHguYyAgICAgICAgICAgICB8IDExICsrLS0K
IGRyaXZlcnMvZnBnYS9kZmwtcGNpLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA5ICsrLS0K
IGRyaXZlcnMvZ3Bpby9ncGlvLW1lcnJpZmllbGQuYyAgICAgICAgICAgICAgICB8IDE0ICsrLS0t
CiAuLi4vbmV0L2V0aGVybmV0L2Nhdml1bS9jb21tb24vY2F2aXVtX3B0cC5jICAgfCAxMCArKy0t
CiAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYyAgfCAyNSArKyst
LS0tLS0KIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BjaS5jICB8IDE4
ICsrKy0tLS0KIGRyaXZlcnMvcGNpL2RldnJlcy5jICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDI0ICstLS0tLS0tLQogZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jICAgICAgICAg
ICAgIHwgNTIgKysrKysrKy0tLS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9wY2kuaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlv
bnMoKyksIDEwOSBkZWxldGlvbnMoLSkKCi0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
