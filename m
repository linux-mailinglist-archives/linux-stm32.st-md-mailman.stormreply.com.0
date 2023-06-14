Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C45D72FEB7
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 14:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DF5AC6B454;
	Wed, 14 Jun 2023 12:33:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C6FBC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 12:32:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1q9Pg9-00018M-BH; Wed, 14 Jun 2023 14:32:49 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1q9Pg8-007Lpl-Ju; Wed, 14 Jun 2023 14:32:48 +0200
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1q9Pg7-00HULW-OK; Wed, 14 Jun 2023 14:32:47 +0200
From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 14 Jun 2023 14:32:21 +0200
Message-Id: <20230614123222.4167460-8-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614123222.4167460-1-l.goehrs@pengutronix.de>
References: <20230614123222.4167460-1-l.goehrs@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/8] dt-bindings: arm: stm32: Add
	compatible string for Linux Automation LXA TAC
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

QWRkIERUIGNvbXBhdGlibGUgc3RyaW5nIGZvciBMaW51eCBBdXRvbWF0aW9uIEdtYkggVGVzdCBB
dXRvbWF0aW9uCkNvbnRyb2xsZXJzIChMWEEgVEFDKS4KTFhBIFRBQ3MgYXJlIGEgZGV2ZWxvcG1l
bnQgdG9vbCBmb3IgZW1iZWRkZWQgZGV2aWNlcyB3aXRoIGEgZm9jdXMgb24KZW1iZWRkZWQgTGlu
dXggZGV2aWNlcy4KCkFzIG9mIG5vdyB0aGVyZSBhcmUgdHdvIFNUTTMyTVAxNTcgYmFzZWQgaGFy
ZHdhcmUgZ2VuZXJhdGlvbnMgKEdlbiAxIGFuZApHZW4gMikgdGhhdCBoYXZlIG1vc3Qgb2YgdGhl
aXIgaGFyZHdhcmUgY29uZmlnIGluIGNvbW1vbi4KSW4gdGhlIGZ1dHVyZSB0aGVyZSB3aWxsIGFs
c28gYmUgYSBTVE0zMk1QMTUzIGJhc2VkIGhhcmR3YXJlIGdlbmVyYXRpb24uCgpTaWduZWQtb2Zm
LWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+CkFja2VkLWJ5OiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgotLS0KIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCB8IDQgKysrLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbApp
bmRleCA0NDY2YjQ1NWJmZmFkLi40YmYyOGU3MTdhNTZmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sCkBAIC0xNDMs
NyArMTQzLDkgQEAgcHJvcGVydGllczoKICAgICAgIC0gZGVzY3JpcHRpb246IE9jdGF2byBPU0Qz
Mk1QMTV4IFN5c3RlbS1pbi1QYWNrYWdlIGJhc2VkIGJvYXJkcwogICAgICAgICBpdGVtczoKICAg
ICAgICAgICAtIGVudW06Ci0gICAgICAgICAgICAgIC0gbHhhLHN0bTMybXAxNTdjLW1jMSAjIExp
bnV4IEF1dG9tYXRpb24gTUMtMQorICAgICAgICAgICAgICAtIGx4YSxzdG0zMm1wMTU3Yy1tYzEg
ICAgICAjIExpbnV4IEF1dG9tYXRpb24gTUMtMQorICAgICAgICAgICAgICAtIGx4YSxzdG0zMm1w
MTU3Yy10YWMtZ2VuMSAjIExpbnV4IEF1dG9tYXRpb24gVEFDIChHZW5lcmF0aW9uIDEpCisgICAg
ICAgICAgICAgIC0gbHhhLHN0bTMybXAxNTdjLXRhYy1nZW4yICMgTGludXggQXV0b21hdGlvbiBU
QUMgKEdlbmVyYXRpb24gMikKICAgICAgICAgICAtIGNvbnN0OiBvY3Qsc3RtMzJtcDE1eHgtb3Nk
MzIKICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDE1NwotLSAK
Mi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
