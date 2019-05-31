Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61B308B7
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2019 08:39:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 007B5C5EC7F
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2019 06:39:16 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01AE0C5E2C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2019 06:39:14 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a23so5577407pff.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2019 23:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SXBhhNmLSZ7SfSIDocpcP+tG+VZK/npThfwPX+RXL68=;
 b=DPebLeDbFNVD5P67tqP0E6NbXfo0GqBg57A5cpk0ASEU2EHf6awCPba6G4D+1PwlRj
 YhsRX/gA0mlYVXED8lkdcJV8bWS2fB9I4CqPcbawD/e2P+1RPta6Kb/8y4DQXjWw9gm0
 +H3zmCDCa3KW537AnnuScG0NEae48ULqRfGYODDp2u4Pv7GdHb+4t17s+Dqj77brlAs5
 JDJRlvf4tsykSLgQU84EyPwqQ6OgsG4flhnrJVBbMlBoDARGLJqIHwj5DbmUPcpAYjKg
 AVCnE0ukyuWLUZelupQ7fL261pnfoDdFWrj6/KLqGfTT8PkZjxmKb5c9viU0i+Qn/TMl
 O4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SXBhhNmLSZ7SfSIDocpcP+tG+VZK/npThfwPX+RXL68=;
 b=uF04NfFabAUy+2lDTIhoG9Fop5FaPXa/oPSj5QjRHgnVPgKc5G43nNcUgbRzD5u8cI
 jM4pEPkui8dkpxNmNMPnIxyIlnfxE5MIbNjq8GCOcwfq9hrzhoPpXwjqlbliw24RloqM
 vZJrAiX7f4UCPwc2TrMyyC6MUmrmNMOtVVNmGs1IaQaW3gQdwQDd/gS1qNzBTAo1gXGX
 kb+yzeqyPMDxhUW7BiQSByUilg0wbOJLDSDj372kML51uJbukeLqE1VqD4M6CjdjlXXp
 YsQ3YC19rHA7i8+mVuXfB5PGlIgkF7+Rt1zNkyE8b+lfQgzz03WKf/txWHUMATEX0csR
 OxgQ==
X-Gm-Message-State: APjAAAXSmFWWG2NmOXCC1PV6pAu3F9K5MOV1o77Vf7jS3avwXJ3i1TMU
 AW+6jArNtK+0mZHQRfzYTO4u
X-Google-Smtp-Source: APXvYqxSXSKcfJHZzFiDp9JVK/XspKz74WHAtcBbnHiEhOKXCoHZ3JHNNC2pEpI0Wj0IJGDLpMcR/g==
X-Received: by 2002:a63:ff52:: with SMTP id s18mr3535804pgk.187.1559284753339; 
 Thu, 30 May 2019 23:39:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:72cb:ebf2:a51d:3877:feab:5634])
 by smtp.gmail.com with ESMTPSA id y12sm4644158pgp.63.2019.05.30.23.39.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 23:39:12 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Fri, 31 May 2019 12:08:45 +0530
Message-Id: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/4] Add Avenger96 board support
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
VGhhbmtzLApNYW5pCgpDaGFuZ2VzIGluIHYzOgoKKiBDb252ZXJ0ZWQgU1RNMzIgcGxhdGZvcm0g
YmluZGluZ3MgdG8gRFQgc2NoZW1hCgpDaGFuZ2VzIGluIHYyOgoKQXMgcGVyIEFsZXgncyByZXZp
ZXc6CgoqIEZpeGVkIEkyQzIgcGluY3RybCBub2RlCiogU29ydGVkIHRoZSBhdmVuZ2VyOTYgZHRi
IGluIGFscGhhYmV0aWNhbCBvcmRlcgoqIEFkZGVkIGRldmljZS10eXBlIHByb3BlcnR5IHRvIG1l
bW9yeSBub2RlCgpNYW5pdmFubmFuIFNhZGhhc2l2YW0gKDQpOgogIEFSTTogZHRzOiBzdG0zMm1w
MTU3OiBBZGQgbWlzc2luZyBwaW5jdHJsIGRlZmluaXRpb25zCiAgZHQtYmluZGluZ3M6IGFybTog
c3RtMzI6IENvbnZlcnQgU1RNMzIgU29DIGJpbmRpbmdzIHRvIERUIHNjaGVtYQogIGR0LWJpbmRp
bmdzOiBhcm06IHN0bTMyOiBEb2N1bWVudCBBdmVuZ2VyOTYgZGV2aWNldHJlZSBiaW5kaW5nCiAg
QVJNOiBkdHM6IEFkZCBBdmVuZ2VyOTYgZGV2aWNldHJlZSBzdXBwb3J0IGJhc2VkIG9uIFNUTTMy
TVAxNTdBCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgIHwg
IDMxICsrCiBhcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1Ny1waW5jdHJsLmR0c2kgICAgIHwgIDc1
ICsrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWF2ZW5nZXI5Ni5kdHMgICB8IDMy
MSArKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNDI4IGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3N0bTMyL3N0bTMyLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTU3YS1hdmVuZ2VyOTYuZHRzCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
