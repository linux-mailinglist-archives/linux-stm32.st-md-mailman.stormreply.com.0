Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D599E9EAC1A
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2024 10:33:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66CBEC78021;
	Tue, 10 Dec 2024 09:33:00 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD4D5C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 09:32:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1tKwbs-00012y-F5
 for linux-stm32@st-md-mailman.stormreply.com; Tue, 10 Dec 2024 10:32:52 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tKwbr-002fKF-1K
 for linux-stm32@st-md-mailman.stormreply.com;
 Tue, 10 Dec 2024 10:32:52 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id D813138A54E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 09:32:51 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id 5601D38A530;
 Tue, 10 Dec 2024 09:32:49 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 03d2ec73;
 Tue, 10 Dec 2024 09:32:48 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 10 Dec 2024 10:32:26 +0100
Message-Id: <20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKoKWGcC/x3MTQqAIBBA4avErBvwJ4i6SrSQHGugLNTCiO6et
 PwW7z0QKTBF6KsHAl0cefcFsq5gWoyfCdkWgxKqkUoKXLNBZzjc6cxIrRZd21lttYOSHIEc538
 3QEybVugpJxjf9wMafIQVagAAAA==
X-Change-ID: 20241210-lxa-fairytux-e730979d3d3f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=HKiruRlQ8GHPPhhFC5ESR04Rr/ImqoZPslgdTnFndnk=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnWAq1AGU1iR460N/LjDVUHpWI3w+EBI35VdzKf
 PM2WBLZsg6JATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ1gKtQAKCRAoOKI+ei28
 b2GgB/sFExtFNFhwSfWjXlZxiBjMv07cQGhZOibWg9XfyOemOkjwBlOQbOjy8E/aNkUVNqKEo3Y
 dBVqILOuuE29FIriIHR05MNLeu6o6hu0feLq2QvOTs09S5xqMtBoCPMtO47NAnc8zYRTxz+YV0J
 +WRNNdQf71yzewgHgVq+6JLgXqqve0/YX9/Mav7/1SvVPY76+sV7qKc3c8typFC6FYvRAnkYU+D
 7fqcjMYxjzmcqHAcJoIsRcC5+7Qlo6eBPOz9zM/RS8kbsAB44lpoKigUDjqZuWK4GIzfzEUC7AZ
 LWVbINtO2I2u2LlR+TUtOl7r5Ph651mbwXVz+QcEHUZA/ZEX
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de,
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH stm32-next 0/2] ARM: dts: stm32:
 lxa-fairytux2: add gen{1, 2} boards
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

SGVsbG8sCgp0aGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBMaW51eCBBdXRvbWF0aW9u
IEdtYkggRmFpcnlUdXgyCmJvYXJkcyBnZW5lcmF0aW9uIDEgYW5kIDIuCgpUaGUgRmFpcnlUdXgy
IGlzIGEgc21hbGwgTGludXggZGV2aWNlIGJhc2VkIG9uIGFuIE9jdGF2byBTeXN0ZW1zCk9TRDMy
TVAxNTNjIFNpUCwgdGhhdCBvY2N1cGllcyBqdXN0IHR3byBzbG90cyBvbiBhIERJTiByYWlsLgoK
cmVnYXJkcywKTWFyYwoKU2lnbmVkLW9mZi1ieTogTWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBwZW5n
dXRyb25peC5kZT4KLS0tCkxlb25hcmQgR8O2aHJzICgyKToKICAgICAgZHQtYmluZGluZ3M6IGFy
bTogc3RtMzI6IGFkZCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIExpbnV4IEF1dG9tYXRpb24gR21i
SCBMWEEgRmFpcnlUdXggMgogICAgICBBUk06IGR0czogc3RtMzI6IGx4YS1mYWlyeXR1eDI6IGFk
ZCBMaW51eCBBdXRvbWF0aW9uIEdtYkggRmFpcnlUdXggMgoKIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9zdG0zMi9zdG0zMi55YW1sICAgICAgIHwgICAyICsKIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIC4uLi9ib290L2R0cy9z
dC9zdG0zMm1wMTUzYy1seGEtZmFpcnl0dXgyLWdlbjEuZHRzIHwgMTAxICsrKysrKwogLi4uL2Jv
b3QvZHRzL3N0L3N0bTMybXAxNTNjLWx4YS1mYWlyeXR1eDItZ2VuMi5kdHMgfCAxNDYgKysrKysr
KysKIC4uLi9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1M2MtbHhhLWZhaXJ5dHV4Mi5kdHNpIHwg
Mzk0ICsrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA2NDUgaW5zZXJ0aW9u
cygrKQotLS0KYmFzZS1jb21taXQ6IDA4ZDMxMmM5NDQwOTVkZjJiNzNlOTk1OWMyYmIxNjA3Mzgy
MGVjZGQKY2hhbmdlLWlkOiAyMDI0MTIxMC1seGEtZmFpcnl0dXgtZTczMDk3OWQzZDNmCgpCZXN0
IHJlZ2FyZHMsCi0tIApNYXJjIEtsZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
