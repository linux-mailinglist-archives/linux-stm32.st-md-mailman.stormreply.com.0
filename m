Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979C86121D
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 13:59:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10CB0C6B47A;
	Fri, 23 Feb 2024 12:59:50 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33D9EC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 12:59:48 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rdV9D-0005Vj-7r; Fri, 23 Feb 2024 13:59:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rdV9B-002QaH-Cu; Fri, 23 Feb 2024 13:59:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rdV9B-00AKBb-0v;
 Fri, 23 Feb 2024 13:59:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 23 Feb 2024 13:59:03 +0100
Message-ID: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=dNTdMhvFNVyajGGdPnCRtbGM3K5852fvZvh1CYrbK2o=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2JaYWAXNZR/7vO+Bhsce5/fJuAZT6zSbuHJIf
 qyZmLanS2iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdiWmAAKCRCPgPtYfRL+
 TsCEB/9hU+G65ugHIoFQGGiGBeQzlf7/ojqYt07VM6PK8HM5TcBKqVYRvdkr2G+JYUPSvJu0XA7
 lkRiL1bokmXfTeF9di/aLwQqxGWm2k1n33BvnTAwUyEKs8Ku/WbNPVt3wcsJjXmsVmYob65XB8h
 XZcxwAx36IZliajjFgcX41VlwYyXbK5xj6QlQU1EnVJoMbrohK/as6V/nIahFkvM3usLvRpx9gn
 s6jMpbpohpPqfhnWRXXzljkY4193tKWCjbyvf6/oKEPjBn2lzwm+GrQ5XSgB5PM/eHd/zMLRHqj
 8KyYqrTwsB2ulA89sHoPOQkHao/DjhfOrr3PBtyMCOHCKs5L
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Joseph Liu <kwliu@nuvoton.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 linux-stm32@st-md-mailman.stormreply.com, NXP Linux Team <linux-imx@nxp.com>,
 openbmc@lists.ozlabs.org, Jai Luthra <j-luthra@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Nas Chung <nas.chung@chipsnmedia.com>, Marvin Lin <kflin@nuvoton.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/5] media: Convert to platform remove
	callback returning void
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgZHJpdmVycyBiZWxvdyBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtIHRvIHN0cnVjdApwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZV9uZXcoKS4gU2Vl
IGNvbW1pdCA1YzVhNzY4MGU2N2IgKCJwbGF0Zm9ybToKUHJvdmlkZSBhIHJlbW92ZSBjYWxsYmFj
ayB0aGF0IHJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQKZXhwbGFuYXRpb24gYW5k
IHRoZSBldmVudHVhbCBnb2FsLgoKQWxsIGNvbnZlcnNhdGlvbnMgYXJlIHRyaXZpYWwsIGJlY2F1
c2UgdGhlaXIgLnJlbW92ZSgpIGNhbGxiYWNrcwpyZXR1cm5lZCB6ZXJvIHVuY29uZGl0aW9uYWxs
eS4KClRoZXJlIGFyZSBubyBpbnRlcmRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoZXNlIHBhdGNoZXMs
IHNvIHRoZXkgY291bGQgYmUKcGlja2VkIHVwIGluZGl2aWR1YWxseS4gQnV0IEknZCBob3BlIHRo
YXQgdGhleSBnZXQgcGlja2VkIHVwIGFsbAp0b2dldGhlciBieSBNYXVyby4KCkJlc3QgcmVnYXJk
cwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICg1KToKICBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjawogICAgcmV0dXJuaW5nIHZvaWQK
ICBtZWRpYTogbnV2b3RvbjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKICBtZWRpYTogbnhwOiBpbXg4LWlzaTogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCiAgbWVkaWE6IHN0bTMyLWRjbWlwcDog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCiAg
bWVkaWE6IHRpOiBqNzIxZS1jc2kycng6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZwogICAgdm9pZAoKIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVk
aWEvd2F2ZTUvd2F2ZTUtdnB1LmMgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9udXZvdG9uL25wY20tdmlkZW8uYyAgICAgICAgICAgICAgICB8IDYgKystLS0tCiBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmMgICAgICAgIHwg
NiArKy0tLS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3Qvc3RtMzIvc3RtMzItZGNtaXBwL2Rj
bWlwcC1jb3JlLmMgfCA2ICsrLS0tLQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS90aS9qNzIxZS1j
c2kycngvajcyMWUtY3NpMnJ4LmMgICAgICB8IDYgKystLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiAzM2UxZDMxODcz
Zjg3ZDExOWU1MTIwYjg4Y2QzNTBlZmE2OGVmMjc2Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
