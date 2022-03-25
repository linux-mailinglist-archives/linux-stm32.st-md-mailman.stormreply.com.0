Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6A4E7A25
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Mar 2022 18:59:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D0C6C628AD;
	Fri, 25 Mar 2022 17:59:04 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98249C628A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 17:59:03 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 89C9683940;
 Fri, 25 Mar 2022 18:59:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648231142;
 bh=aRcvhFxhUgNMFHxGbQZDCZbz1MVbIhTfwVJrIlBjhMU=;
 h=From:To:Cc:Subject:Date:From;
 b=x1CsJ6Cif1QzZ7ZYEvZTllTvZ2hWOt3/lq/2kLEHAYYFcTQB1jOcEIs662D4z7URr
 gyvABtSbWAcgBcJDCtVyCOCBN1nEYivpFywjjYC3Eu0zEQI+tUmM/FV4g5quZN7qxj
 7Aw87kyZ4Hat/ATrzm4X0ISjmINaAIjXhsngdL/9eNok+LjlAn4zQOby0Wyfp7oeXj
 x2vlDwBnuhmWn0gNmhIGWMaztXl0Mt9Kb2yvBQPyurmB0c5Xp7IAMJv9c3/CbkbGEx
 CoMe6qWC+MxjiMqnUVvV2boOlyi3b79kC/W8kMTYDSTaeNHcFiqQD5gAkP0mNnguq2
 pTVdCxkid3CdQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 25 Mar 2022 18:58:51 +0100
Message-Id: <20220325175851.70083-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix PHY post-reset delay on
	Avenger96
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

UGVyIEtTWjkwMzFSTlggUEhZIGRhdGFzaGVldCBGSUdVUkUgNy01OiBQT1dFUi1VUC9QT1dFUi1E
T1dOL1JFU0VUIFRJTUlORwpOb3RlIDI6IEFmdGVyIHRoZSBkZS1hc3NlcnRpb24gb2YgcmVzZXQs
IHdhaXQgYSBtaW5pbXVtIG9mIDEwMCDOvHMgYmVmb3JlCnN0YXJ0aW5nIHByb2dyYW1taW5nIG9u
IHRoZSBNSUlNIChNREMvTURJTykgaW50ZXJmYWNlLgoKQWRkIDFtcyBwb3N0LXJlc2V0IGRlbGF5
IHRvIGd1YXJhbnRlZSB0aGlzIGZpZ3VyZS4KCkZpeGVzOiAwMTBjYTlmZTUwMGJmICgiQVJNOiBk
dHM6IHN0bTMyOiBBZGQgbWlzc2luZyBldGhlcm5ldCBQSFkgcmVzZXQgb24gQVY5NiIpClNpZ25l
ZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgpDYzogQWxleGFuZHJlIFRvcmd1
ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgpDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5k
ZWxhdW5heUBmb3NzLnN0LmNvbT4KQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwotLS0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNpIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNpCmluZGV4IDYxZTE3ZjQ0Y2U4MTUuLjc2
YzU0YjAwNmQ4NzEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRo
Y29yLWF2ZW5nZXI5Ni5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRo
Y29yLWF2ZW5nZXI5Ni5kdHNpCkBAIC0xNDEsNiArMTQxLDcgQEAgbWRpbzAgewogCQljb21wYXRp
YmxlID0gInNucHMsZHdtYWMtbWRpbyI7CiAJCXJlc2V0LWdwaW9zID0gPCZncGlveiAyIEdQSU9f
QUNUSVZFX0xPVz47CiAJCXJlc2V0LWRlbGF5LXVzID0gPDEwMDA+OworCQlyZXNldC1wb3N0LWRl
bGF5LXVzID0gPDEwMDA+OwogCiAJCXBoeTA6IGV0aGVybmV0LXBoeUA3IHsKIAkJCXJlZyA9IDw3
PjsKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
