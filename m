Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED99EAC1C
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2024 10:33:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58774C78014;
	Tue, 10 Dec 2024 09:33:00 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF370C7801C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 09:32:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1tKwbs-00013G-K4
 for linux-stm32@st-md-mailman.stormreply.com; Tue, 10 Dec 2024 10:32:52 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tKwbr-002fKK-1i
 for linux-stm32@st-md-mailman.stormreply.com;
 Tue, 10 Dec 2024 10:32:52 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id EF75038A54F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 09:32:51 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id 71CCC38A531;
 Tue, 10 Dec 2024 09:32:49 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id ab1b1a1b;
 Tue, 10 Dec 2024 09:32:48 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 10 Dec 2024 10:32:27 +0100
MIME-Version: 1.0
Message-Id: <20241210-lxa-fairytux-v1-1-9aea01cdb83e@pengutronix.de>
References: <20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de>
In-Reply-To: <20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=CjTHBR+MROHxR79/okvi7tDY+Vb+yOt4fEPRaYt9NAs=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnWAq6nuvrx7ZjBpHRG/Lu23Dp1lKKBfpQ/DIqV
 1oYAYh1IfGJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ1gKugAKCRAoOKI+ei28
 b4b9B/oDqCmrtmOFjzFGKPqZbZUTQozlfYxc6QiIxoly2xegdgXLINaMqMYyr3G4/jI59NXEbWK
 nshIs34MqweozmtIxCR669HpAdqa8GFw8eciaESH7zvo15dmbs3gdziZHrUmAhefc8kyvD3Ib9D
 QpobzLY++plIq2fv6Um9hCxtzCp9lz9MNlW3y2OIGr3miZ4iK5AUlp0OeKtpsXwcd2WabClA6by
 APecPTC6fdaYSgOrEmg4i6D4IzA9VgkXzXK3OLXVzZOc0y+4/y9F2kIUoFDLyoW2QtWlPFY7ByY
 LnwFiBk67vD4OS+wPRM/0/DlMq2gjimbMKhzi55SGEQv8Z7P
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
Subject: [Linux-stm32] [PATCH stm32-next 1/2] dt-bindings: arm: stm32: add
 compatible strings for Linux Automation GmbH LXA FairyTux 2
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

RnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgoKVGhlIExpbnV4
IEF1dG9tYXRpb24gR21iSCBGYWlyeVR1eDIgaXMgYSBzbWFsbCBMaW51eCBkZXZpY2UgYmFzZWQg
b24KYW4gT2N0YXZvIFN5c3RlbXMgT1NEMzJNUDE1M2MgU2lQLCB0aGF0IG9jY3VwaWVzIGp1c3Qg
dHdvIHNsb3RzIG9uIGEKRElOIHJhaWwuCgpBZGQgY29tcGF0aWJsZSBmb3IgdGhlIGdlbmVyYXRp
b24gMSBhbmQgMiBiYXNlZCBvbiB0aGUgU1RNMzJNUDE1M2MuCgpTaWduZWQtb2ZmLWJ5OiBMZW9u
YXJkIEfDtmhycyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IE1hcmMg
S2xlaW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9uaXguZGU+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbAppbmRleCBiNmM1NmQ0Y2U2Yjk1MTU1NjVm
YzA1MzQ4ODk2YmE5ZjQwMDY0M2YwLi42ODI1ZDk2NWRhM2RhZjJiNTA4ZmJkODhlOGM5ZDQwZTIw
YmExZjU5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3N0bTMyL3N0bTMyLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9zdG0zMi9zdG0zMi55YW1sCkBAIC05NCw2ICs5NCw4IEBAIHByb3BlcnRpZXM6CiAgICAg
ICAtIGRlc2NyaXB0aW9uOiBPY3Rhdm8gT1NEMzJNUDE1MyBTeXN0ZW0taW4tUGFja2FnZSBiYXNl
ZCBib2FyZHMKICAgICAgICAgaXRlbXM6CiAgICAgICAgICAgLSBlbnVtOgorICAgICAgICAgICAg
ICAtIGx4YSxzdG0zMm1wMTUzYy1mYWlyeXR1eDItZ2VuMSAjIExpbnV4IEF1dG9tYXRpb24gRmFp
cnlUdXggMiAoR2VuZXJhdGlvbiAxKQorICAgICAgICAgICAgICAtIGx4YSxzdG0zMm1wMTUzYy1m
YWlyeXR1eDItZ2VuMiAjIExpbnV4IEF1dG9tYXRpb24gRmFpcnlUdXggMiAoR2VuZXJhdGlvbiAy
KQogICAgICAgICAgICAgICAtIGx4YSxzdG0zMm1wMTUzYy10YWMtZ2VuMyAjIExpbnV4IEF1dG9t
YXRpb24gVEFDIChHZW5lcmF0aW9uIDMpCiAgICAgICAgICAgLSBjb25zdDogb2N0LHN0bTMybXAx
NTN4LW9zZDMyCiAgICAgICAgICAgLSBjb25zdDogc3Qsc3RtMzJtcDE1MwoKLS0gCjIuNDUuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
