Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E86141EE
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 20:41:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66D20C5F1E3
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 18:41:29 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72CA7C5A4C9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2019 05:31:38 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d31so2166445pgl.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 22:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbA+h1SWOeC+A9lxbgQ9nyiTDR7RZSnCD5SEiXc6Chc=;
 b=Lnij2FPqvmSvFcPoNxUkNY/JS83WNPIYA/lZMituG08241YitIDNyfyYAsIOyD2Vh7
 mPJcAWqwUWvDcuiJDnes/xhUyrREUUDjtGk72y8FQISb0WqkF/rLk2Y5TsKzoEM1vnpc
 t78JV1qjKZGg6Bg4HyO2Q+i76zrgSDWvXioq5M5V33GczeXpvgZQjQFnqx3Mlct7t1Tn
 CpexQ+3yESDh8pR647ZS71i1ozQR7ZdPGPXXXGF6WoreVf5pNozrPzsHYgBwzR9Vd17M
 e4+0EOPKodzzCLmTEltxUcckAVPtISrrtbLDxDNUCw3BTjZTOFiqLj7nJUFHyOeL/Ezt
 xztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbA+h1SWOeC+A9lxbgQ9nyiTDR7RZSnCD5SEiXc6Chc=;
 b=ODSsxacuadLHBsIAS1BAPzDEqwuKDXqUgTBOIBeAPCHcq/EoMbgnQzbCQX81+URNoB
 aRfH2mKhdldWEXpsDe7psnW+jzvZJBdh3pBXDAwoHv50/rP1Xmd9TICet5CmkcibztRg
 MxqAnIvPUCbSgzTf1arFzSv0eSAbKHRv9nWk886x7Lb1vSTFYKhFICtrmc/zaewJHo1Z
 WncQqBEU++CgNJxOb3+bB+drROsK2FoQJfSzys7RVc4gEnvHo9jVPNsegE3V84m/DPIS
 vErkwetotZ065JlwHCVjDn1I9wKysv1WfbaDOVxfirgYFHmzAFJBWs2jTiC334qOYjFW
 f+WQ==
X-Gm-Message-State: APjAAAVMMlZNTVHs6yAJEd4voCmvQOfKBZBs4z40OyvQVcue5zbIVk+1
 NRVjVAgqscXwaN+4ubcSNlJZ
X-Google-Smtp-Source: APXvYqwdnJ1wGysGVAJNxsji+b4A9Fu8qkeqQd4DxFfJGQBIFlAwwOQZoni5fRsBgxCIpFPuLIDZLg==
X-Received: by 2002:a65:5246:: with SMTP id q6mr8137656pgp.296.1556861496796; 
 Thu, 02 May 2019 22:31:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:72c7:3835:31df:f367:f70b:ed86])
 by smtp.gmail.com with ESMTPSA id l15sm1152226pgb.71.2019.05.02.22.31.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 22:31:36 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Fri,  3 May 2019 11:01:20 +0530
Message-Id: <20190503053123.6828-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 18:41:28 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] Add Avenger96 board support
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
VSBhbmQgaGFzIHRoZSBmb2xsb3dpbmcgZmVhdHVyZXM6CiAgICAKU29DOiBTVE0zMk1QMTU3QUFD
ClBNSUM6IFNUUE1JQzFBClJBTTogMTAyNCBNYnl0ZSBAIDUzM01IegpTdG9yYWdlOiBlTU1DIHY0
LjUxOiA4IEdieXRlCiAgICAgICAgIG1pY3JvU0QgU29ja2V0OiBVSFMtMSB2My4wMQpFdGhlcm5l
dCBQb3J0OiAxMC8xMDAvMTAwMCBNYml0L3MsIElFRUUgODAyLjMgQ29tcGxpYW50CldpcmVsZXNz
OiBXaUZpIDUgR0h6ICYgMi40R0h6IElFRUUgODAyLjExYS9iL2cvbi9hYwogICAgICAgICAgQmx1
ZXRvb3Rowq52NC4yIChCUi9FRFIvQkxFKQpVU0I6IDJ4IFR5cGUgQSAoVVNCIDIuMCkgSG9zdCBh
bmQgMXggTWljcm8gQiAoVVNCIDIuMCkgT1RHCkRpc3BsYXk6IEhETUk6IFdYR0EgKDEzNjZ4NzY4
KUAgNjAgZnBzLCBIRE1JIDEuNApMRUQ6IDR4IFVzZXIgTEVELCAxeCBXaUZpIExFRCwgMXggQlQg
TEVECgpNb3JlIGluZm9ybWF0aW9uIGFib3V0IHRoaXMgYm9hcmQgY2FuIGJlIGZvdW5kIGluIDk2
Qm9hcmRzIHdlYnNpdGU6Cmh0dHBzOi8vd3d3Ljk2Ym9hcmRzLm9yZy9wcm9kdWN0L2F2ZW5nZXI5
Ni8KClRoYW5rcywKTWFuaQoKTWFuaXZhbm5hbiBTYWRoYXNpdmFtICgzKToKICBkdC1iaW5kaW5n
czogYXJtOiBzdG0zMjogRG9jdW1lbnQgQXZlbmdlcjk2IGRldmljZXRyZWUgYmluZGluZwogIEFS
TTogZHRzOiBzdG0zMm1wMTU3OiBBZGQgbWlzc2luZyBwaW5jdHJsIGRlZmluaXRpb25zCiAgQVJN
OiBkdHM6IEFkZCBBdmVuZ2VyOTYgZGV2aWNldHJlZSBzdXBwb3J0IGJhc2VkIG9uIFNUTTMyTVAx
NTdBCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnR4dCAgIHwgICA2
ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSAr
CiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3LXBpbmN0cmwuZHRzaSAgICAgfCAgNjIgKysr
KwogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtYXZlbmdlcjk2LmR0cyAgIHwgMzIwICsr
KysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAzODkgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWF2ZW5nZXI5Ni5k
dHMKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
