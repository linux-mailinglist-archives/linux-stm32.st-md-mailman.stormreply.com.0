Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C1614817
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 12:05:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E105ECA8E5E
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 10:05:48 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB4EACA8E5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 10:05:47 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 13so6183669pfw.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 May 2019 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzJC2cGnv4guPyK0TH8rxdCNy91Y2MqZHMVt0Hj1UZg=;
 b=NL1GyKgbriLVakxOq1jPwdxkfiGtpgzEVVNcaaGHD2TRfHVkTxbpCyNV/1ywD9Jw5w
 yfbKzH10+nSa4f1w868NzXQMhVjbjmb9hcWAJs2OIuuLBlApd7pU5kTD2U/5l0YSzSBm
 T2si2DEKppfFDmics//fwthVrvWKMnT78xAG1Wvz/uAfRWN9q7+0TPNvG6ZTgCFIVNae
 Iwc+ttvFGJj/N6XC7LZdcgBXrXblJ+kJdiJ4ZQo3uxX+qz7h956lAdwSK8YtWglHxHVs
 eRA9iqWc8ouN3gnGRhDk9I0VAD/2YnJbslPtEv+zv0seh2Oryf5aakf1VOhaRLdQp6Bf
 /BXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzJC2cGnv4guPyK0TH8rxdCNy91Y2MqZHMVt0Hj1UZg=;
 b=kgcyRXi+OR+YC2/AcrzJMPzlWnVPMvfJL/sljKSZLNo8AAXvk12F3p9Gp14CHm3Coq
 PIV9sxW+e3GkRGojsMGua9rli+BgCvOMrYnnyDXo1aLefrox2UmTI714Ro39BCnA132Q
 Nu4GsrM7oicsfODTx3Uv/wHg6DcBKezMufC6ToGQqsnRAYrIO039hz5xpPhoqYVujNE1
 zi2EAPaR8OLzAy69cVB89GUn1u+UZ5Fww7xq6yMiSLMZhkvL+cnqvorK3pXII2hMufD/
 JwL677gADNtjM6NeWixqtQrGHSMqlGApcZDeCWk7wWmS80lT/n1N+SaoNE5quif5Wy+I
 jecw==
X-Gm-Message-State: APjAAAXVcQtcfduTZbUiFsxO75zSN8nQdPcpP7lziCvmp+iNgutQtpWQ
 hu4ujYXmR97BVq52btH4/gj+
X-Google-Smtp-Source: APXvYqz0D0CtKqL3bIVtaE3Zyo+/xiVoozF07VaHqELDfSxUqbd9yW66ihVnrA16JSi02lR98iLN2Q==
X-Received: by 2002:a62:3684:: with SMTP id d126mr31872502pfa.70.1557137146052; 
 Mon, 06 May 2019 03:05:46 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:611b:55a4:e119:3b84:2d86:5b07])
 by smtp.gmail.com with ESMTPSA id c137sm16229653pfb.154.2019.05.06.03.05.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 03:05:45 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Mon,  6 May 2019 15:35:31 +0530
Message-Id: <20190506100534.24145-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] Add Avenger96 board support
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
VGhhbmtzLApNYW5pCgpDaGFuZ2VzIGluIHYyOgoKQXMgcGVyIEFsZXgncyByZXZpZXc6CgoqIEZp
eGVkIEkyQzIgcGluY3RybCBub2RlCiogU29ydGVkIHRoZSBhdmVuZ2VyOTYgZHRiIGluIGFscGhh
YmV0aWNhbCBvcmRlcgoqIEFkZGVkIGRldmljZS10eXBlIHByb3BlcnR5IHRvIG1lbW9yeSBub2Rl
CgpNYW5pdmFubmFuIFNhZGhhc2l2YW0gKDMpOgogIGR0LWJpbmRpbmdzOiBhcm06IHN0bTMyOiBE
b2N1bWVudCBBdmVuZ2VyOTYgZGV2aWNldHJlZSBiaW5kaW5nCiAgQVJNOiBkdHM6IHN0bTMybXAx
NTc6IEFkZCBtaXNzaW5nIHBpbmN0cmwgZGVmaW5pdGlvbnMKICBBUk06IGR0czogQWRkIEF2ZW5n
ZXI5NiBkZXZpY2V0cmVlIHN1cHBvcnQgYmFzZWQgb24gU1RNMzJNUDE1N0EKCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIudHh0ICAgfCAgIDYgKwogYXJjaC9hcm0vYm9v
dC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTctcGluY3RybC5kdHNpICAgICB8ICA3NSArKysrCiBhcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3YS1hdmVuZ2VyOTYuZHRzICAgfCAzMjEgKysrKysrKysrKysrKysrKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDQwMyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtYXZlbmdlcjk2LmR0cwoKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
