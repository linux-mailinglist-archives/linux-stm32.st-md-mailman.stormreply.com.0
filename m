Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 996A88ADF71
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 10:07:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62C12C7128A;
	Tue, 23 Apr 2024 08:07:30 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1044FC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 08:07:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzBBL-000355-JC; Tue, 23 Apr 2024 10:07:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rzBBJ-00Dq1P-PO; Tue, 23 Apr 2024 10:07:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rzBBJ-006nfj-2B;
 Tue, 23 Apr 2024 10:07:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 23 Apr 2024 10:06:57 +0200
Message-ID: <cover.1713858615.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2749;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=gTA+U5yuGNOEcXpkq6H/RGP6EzMzw98g+E2AQI6/KKc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmJ2wkJtP7uKVFJr65YKlun3Sa3zIpF0mVkZzyW
 S0lUmWw2TWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZidsJAAKCRCPgPtYfRL+
 TlX8B/9sNmg+kwtLiSfGlytMonwVogJbiWU0a4RnUphy0xrt85UtOvn62fa+qR2YdtKX3MENfFi
 cBNWgFgjvKg4zEKjmFEk+rEzq4fMkj/ZNwq1SJsZmA6fPeq/0bRXpR9G3a8Z0d2sY4/D/fKFxoM
 d5Kd6j5ZqVm1SaClarCbatqmUNBEAf9f6X4gVqgXS9bujI+5qHisMw8OW9N1UJ8vNqOOlXyEWpQ
 Zu0ikOjAN5fL6oh4qF5l4niKZur5STuUMb6Qf50+VeswDxRD+ljMEr4f9QiX0Hzh6Fyhit21Rqn
 SsXw97V9dimGckGbLSU+pKKaXmw+r5uCiMXqm1aRleWR9pJa
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 James Clark <james.clark@arm.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH 0/5] coresight: Convert to platform remove
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyBhIGZldyBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93
IGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodAp0aGF0IHJlY2VudGx5IHN0YXJ0ZWQgdG8gaW1w
bGVtZW50IGEgLnJlbW92ZSgpIGNhbGxiYWNrIHRvIGltcGxlbWVudAoucmVtb3ZlX25ldygpIGlu
c3RlYWQuIFNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06IFByb3ZpZGUgYSByZW1v
dmUKY2FsbGJhY2sgdGhhdCByZXR1cm5zIG5vIHZhbHVlIikgZm9yIGFuIGV4dGVuZGVkIGV4cGxh
bmF0aW9uIGFuZCB0aGUgZXZlbnR1YWwKZ29hbC4KCkFsbCBjb252ZXJzYXRpb25zIGFyZSB0cml2
aWFsLCBiZWNhdXNlIHRoZSBkcml2ZXIncyAucmVtb3ZlKCkgY2FsbGJhY2tzCnJldHVybmVkIHpl
cm8gdW5jb25kaXRpb25hbGx5IGFscmVhZHkuCgpUaGVyZSBhcmUgbm8gaW50ZXJkZXBlbmRlbmNp
ZXMgYmV0d2VlbiB0aGUgZml2ZSBwYXRjaGVzLCBzbyB0aGV5IGNvdWxkIGJlIHBpY2tlZAp1cCBp
bmRpdmlkdWFsbHkgaWYgbmVlZCBiZS4gQWZ0ZXIgdGhlIG1lcmdlIHdpbmRvdyBsZWFkaW5nIHRv
IHY2LjEwLXJjMQooYXNzdW1pbmcgTGludXMgaGFzID49IDEwIGZpbmdlcnMgdGhpcyBjeWNsZSA6
LSkgSSB3YW50IHRvIHN3aXRjaCB0aGUgcHJvdG90eXBlCm9mIHN0cnVjdCBwbGF0Zm9ybV9kcml2
ZXI6OnJlbW92ZSB0byByZXR1cm4gdm9pZC4gU28gcGxlYXNlIGVpdGhlciBtZXJnZSB0aGlzCnNl
cmllcyB0b2dldGhlciB3aXRoIHRoZSBjb21taXRzIGludHJvZHVjaW5nIC5yZW1vdmUoKSB0aGF0
IGN1cnJlbnRseSBzaXQgaW4KdGhlIG5leHQgYnJhbmNoIG9mCmdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jb3Jlc2lnaHQvbGludXguZ2l0LCBvciBhY2NlcHQg
bWUKc2VuZGluZyB0aGVtIHRvZ2V0aGVyIHdpdGggdGhlIHBhdGNoIGNoYW5naW5nIHRoZSBmdW5j
dGlvbidzIHByb3RvdHlwZSBmb3IKaW5jbHVzaW9uIHRvIEdyZWcncyBkcml2ZXItY29yZSB0cmVl
LgoKSGF2aW5nIHNhaWQgdGhhdCwgdGhlIHBhdGNoZXMgYWRkaW5nIHBsYXRmb3JtIGRyaXZlciBz
dXBwb3J0IGZvciB0aGVzZSBjb3VsZCBiZQppbXByb3ZlZDoKCiAtIGRldl9nZXRfZHJ2ZGF0YSgp
IG5ldmVyIHJldHVybnMgTlVMTCBpbiB0aGVzZSAucmVtb3ZlKCkgZnVuY3Rpb25zIGJlY2F1c2UK
ICAgLnByb2JlKCkgY2FsbGVkIGRldl9zZXRfZHJ2ZGF0YSgpLiBGb3IgdGhlIHVzYWdlIG9mIFdB
Uk5fT04gYWxzbyBzZWUKICAgaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzk2OTkyMy8uIChUaGF0
IGxpbmsncyBjb250ZW50IGlzIGJlaGluZCBhIHBheXdhbGwKICAgdW50aWwgTWF5IDIsIHRoZSBU
TERSIGlzOiBEb24ndCB1c2UgV0FSTl9PTigpLikgU28gdGhlIHJlc3BlY3RpdmUgY2hlY2tzCiAg
IHdpdGggdGhlIGVhcmx5IHJldHVybiBjb3VsZCBiZXR0ZXIgYmUgZHJvcHBlZCBJTUhPLgoKIC0g
SVNfRVJSX09SX05VTEwoZHJ2ZGF0YS0+cGNsaykgaXMgbmV2ZXIgdHJ1ZSBpbiAucmVtb3ZlKCku
IEFsc28gbm90ZSB0aGF0CiAgIElTX0VSUl9PUl9OVUxMIGlzIHVnbHkgYW5kIGdpdmVzIGhhcmRs
eSBldmVyIHRoZSByaWdodCBjb25kaXRpb24gdG8gY2hlY2sKICAgZm9yLiBOb3RlIGZ1cnRoZXIg
dGhhdCBjbGsgPT0gTlVMTCBpc24ndCB1c3VhbGx5IGEgcHJvYmxlbSwgTlVMTCBpcyB1c2VkIGFz
CiAgIGR1bW15IGNsayByZXR1cm5lZCBieSBjbGtfZ2V0X29wdGlvbmFsKCkgYW5kIGFsbCBjbG9j
ayBBUEkgZnVuY3Rpb25zIGhhbmRsZQogICB0aGF0IGp1c3QgZmluZS4gU28gaWYgYXQgYWxsLCBi
ZXR0ZXIgY2hlY2sgb25seSBmb3IgSVNfRVJSKGRydmRhdGEtPnBjbGspLgoKQmVzdCByZWdhcmRz
ClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDUpOgogIGNvcmVzaWdodDogY2F0dTogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBjb3Jlc2lnaHQ6IGRl
YnVnOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAog
IGNvcmVzaWdodDogc3RtOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZAogIGNvcmVzaWdodDogdG1jOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcgdm9pZAogIGNvcmVzaWdodDogdHBpdTogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKCiBkcml2ZXJzL2h3dHJhY2luZy9j
b3Jlc2lnaHQvY29yZXNpZ2h0LWNhdHUuYyAgICAgIHwgNyArKystLS0tCiBkcml2ZXJzL2h3dHJh
Y2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNwdS1kZWJ1Zy5jIHwgNyArKystLS0tCiBkcml2ZXJz
L2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXN0bS5jICAgICAgIHwgNyArKystLS0tCiBk
cml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRtYy1jb3JlLmMgIHwgNyArKyst
LS0tCiBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRwaXUuYyAgICAgIHwg
NyArKystLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9u
cygtKQoKYmFzZS1jb21taXQ6IGE1OTY2OGE5Mzk3ZTcyNDViMjZlOWJlODVkMjNmMjQyZmY3NTdh
ZTgKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
