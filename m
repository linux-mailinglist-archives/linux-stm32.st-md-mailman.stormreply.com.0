Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 797EA41E49
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 09:55:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E987C5DBD6
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 07:55:07 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4670C5DBD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 07:55:04 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id v11so8469872pgl.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/zZQ82E/N4gFFsCTmRZdYbvd54D5nSgY4uOp2BfUg4=;
 b=JMuYTPILm5oCrO9h51xNSn+tS6CagMc0yZFGqpOBe60q4o0BGqiouryTqq5e1OMzHD
 rPPNZ6vtqqgXRNsjRVtnkphRfkUPh+ageRVwawW3Zb9/JzbfLx2+gbG/Q05yndF8bg80
 fdkSyEiFKeDP8Zg8eMMFLl4Xygesmch6UQi95PqTzgRYLLjzZCkfdxLcdEBzGvaufIuM
 mcjHpczgaPIKv5/CQL1z9f3shXhEdLul5A9x2m0C5DeWaO8pItHJXx2sKOUZ/3wzfyQz
 tO9WxRv1cwUSO9K7qfKf6uCA5ogtyUUpa4CaHtiviKvqDF28bKJZ/M9N7zW914ZOfNaF
 a9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/zZQ82E/N4gFFsCTmRZdYbvd54D5nSgY4uOp2BfUg4=;
 b=pkh15fGs/5SnfFaIGcPxmZT/Spgc71pKNL3wIU10rLau+mCdbsHzMQrMTsWZ5ntnGa
 CIciA4FHuQ1Wh+aj6jv8ZEeOR3mdWvPN+ZIj0aJcFprz6SMQzvnzAaXw+kdvldryBkSf
 7p4ivVlRCB1kCa2pg1Ycr4hkJ3GpiBpXBec9cfr7r2Hr5IMGZ3Fim2X354p5pQA3h3Ia
 nDXADS2TmfCbIv9pyCIQaPUBLmlNK0Z5iJuYzaRUCBD/pXQguwUIuGoa7ZglUjwaQdG2
 q2eRcoWbmITdCWfMN5DxlYo4tnIpCVkdsReKPZ6Zvtolsb7c+mhS+uZvgwmNXrojWa4L
 WVSg==
X-Gm-Message-State: APjAAAVGFI24bzhIf49P4Qjbhhb2AUH9z1jMJRJgz0famELG32M5Wd7E
 lzoqAyzhxmNTv/bVKjpfxi+p
X-Google-Smtp-Source: APXvYqyhsNDJVnEra02+JvmqkHRHXuSl223Vx4mOQwGbwFeFfO1wG9ZHDU3uBEIjt7IKjmaKTRH8Uw==
X-Received: by 2002:a17:90b:8d6:: with SMTP id
 ds22mr31537248pjb.143.1560326103017; 
 Wed, 12 Jun 2019 00:55:03 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:894:d456:15b5:9ca9:e3ec:c06a])
 by smtp.gmail.com with ESMTPSA id b15sm16846399pfi.141.2019.06.12.00.54.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 00:55:02 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Wed, 12 Jun 2019 13:24:47 +0530
Message-Id: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, loic.pallardy@st.com,
 linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/4] Add Avenger96 board support
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

SGVsbG8sCgpUaGlzIHBhdGNoc2V0IGFkZHMgQXZlbmdlcjk2IGJvYXJkIHN1cHBvcnQuIFRoaXMg
Ym9hcmQgaXMgb25lIG9mIHRoZQpDb25zdW1lciBFZGl0aW9uIGJvYXJkcyBvZiB0aGUgOTZCb2Fy
ZHMgZmFtaWx5IGZyb20gQXJyb3cgRWxlY3Ryb25pY3MKZmVhdHVyaW5nIFNUTTMyTVAxNTdBIE1Q
VSBhbmQgaGFzIHRoZSBmb2xsb3dpbmcgZmVhdHVyZXM6CgpTb0M6IFNUTTMyTVAxNTdBQUMKUE1J
QzogU1RQTUlDMUEKUkFNOiAxMDI0IE1ieXRlIEAgNTMzTUh6ClN0b3JhZ2U6IGVNTUMgdjQuNTE6
IDggR2J5dGUKICAgICAgICAgbWljcm9TRCBTb2NrZXQ6IFVIUy0xIHYzLjAxCkV0aGVybmV0IFBv
cnQ6IDEwLzEwMC8xMDAwIE1iaXQvcywgSUVFRSA4MDIuMyBDb21wbGlhbnQKV2lyZWxlc3M6IFdp
RmkgNSBHSHogJiAyLjRHSHogSUVFRSA4MDIuMTFhL2IvZy9uL2FjCiAgICAgICAgICBCbHVldG9v
dGjCrnY0LjIgKEJSL0VEUi9CTEUpClVTQjogMnggVHlwZSBBIChVU0IgMi4wKSBIb3N0IGFuZCAx
eCBNaWNybyBCIChVU0IgMi4wKSBPVEcKRGlzcGxheTogSERNSTogV1hHQSAoMTM2Nng3NjgpQCA2
MCBmcHMsIEhETUkgMS40CkxFRDogNHggVXNlciBMRUQsIDF4IFdpRmkgTEVELCAxeCBCVCBMRUQK
Ck1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhpcyBib2FyZCBjYW4gYmUgZm91bmQgaW4gOTZCb2Fy
ZHMgd2Vic2l0ZToKaHR0cHM6Ly93d3cuOTZib2FyZHMub3JnL3Byb2R1Y3QvYXZlbmdlcjk2LwoK
VGhhbmtzLApNYW5pCgpDaGFuZ2VzIGluIHY0CgoqIERlbGV0ZWQgdGhlIG9sZCBzdG0zMi50eHQg
YmluZGluZwoqIEFkZGVkIFJvYidzIFJldmlld2VkLWJ5IHRhZwoKQ2hhbmdlcyBpbiB2MzoKCiog
Q29udmVydGVkIFNUTTMyIHBsYXRmb3JtIGJpbmRpbmdzIHRvIERUIHNjaGVtYQoKQ2hhbmdlcyBp
biB2MjoKCkFzIHBlciBBbGV4J3MgcmV2aWV3OgoKKiBGaXhlZCBJMkMyIHBpbmN0cmwgbm9kZQoq
IFNvcnRlZCB0aGUgYXZlbmdlcjk2IGR0YiBpbiBhbHBoYWJldGljYWwgb3JkZXIKKiBBZGRlZCBk
ZXZpY2UtdHlwZSBwcm9wZXJ0eSB0byBtZW1vcnkgbm9kZQoKTWFuaXZhbm5hbiBTYWRoYXNpdmFt
ICg0KToKICBBUk06IGR0czogc3RtMzJtcDE1NzogQWRkIG1pc3NpbmcgcGluY3RybCBkZWZpbml0
aW9ucwogIGR0LWJpbmRpbmdzOiBhcm06IHN0bTMyOiBDb252ZXJ0IFNUTTMyIFNvQyBiaW5kaW5n
cyB0byBEVCBzY2hlbWEKICBkdC1iaW5kaW5nczogYXJtOiBzdG0zMjogRG9jdW1lbnQgQXZlbmdl
cjk2IGRldmljZXRyZWUgYmluZGluZwogIEFSTTogZHRzOiBBZGQgQXZlbmdlcjk2IGRldmljZXRy
ZWUgc3VwcG9ydCBiYXNlZCBvbiBTVE0zMk1QMTU3QQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9zdG0zMi9zdG0zMi50eHQgICB8ICAxMCAtCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vc3RtMzIvc3RtMzIueWFtbCAgfCAgMzEgKysKIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3
LXBpbmN0cmwuZHRzaSAgICAgfCAgNzUgKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
N2EtYXZlbmdlcjk2LmR0cyAgIHwgMzIxICsrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFu
Z2VkLCA0MjggaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi50eHQK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3N0bTMyL3N0bTMyLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTU3YS1hdmVuZ2VyOTYuZHRzCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
