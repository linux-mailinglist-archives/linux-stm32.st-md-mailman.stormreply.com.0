Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E776669304B
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Feb 2023 12:26:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91752C6A5F0;
	Sat, 11 Feb 2023 11:26:04 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 065EBC6A5EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 11:26:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQo10-0000OS-4t; Sat, 11 Feb 2023 12:25:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQo0w-004CUt-Og; Sat, 11 Feb 2023 12:25:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQo0x-002fAh-9S; Sat, 11 Feb 2023 12:25:55 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Sat, 11 Feb 2023 12:24:31 +0100
Message-Id: <20230211112431.214252-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230211112431.214252-1-u.kleine-koenig@pengutronix.de>
References: <20230211112431.214252-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2699;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=4BU461RB5eJjfSuBpdV/EuyEVzwdP4GItG87V7TBGiI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj53rrPM02aIhWnYFNYUsKWDZCfD/SwQRMXQEk8q/x
 kpNoXd+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+d66wAKCRDB/BR4rcrsCbGNCA
 CALtXK+Ez856iCqbWBmGtorFkSoNgj5mSf8VkP716wgxF6kyFJQfe4CieNhFAnU/8JC1f+UK9KWxWy
 kD1hLrPfh/bRc07nJAV8/VvnOMTTKCmkMjJ+7QMZSayrQ2VTgbMxF41mDfPTl3p3MpYxfKCs/uKQ/0
 3od7marCMpUn6Kzypq0v+B2MdYAvSHZX6B5ANwPS2ikDih0phs1iPLm7XG6mbu4z8OvQ23d4ArmypO
 a6MfNCU4RQ7DT83nRZsAECQbRU0DJEmgHII9OEqqIb5JycyVbAkKfd7/FQYsdFMA7TqCu+wfkE4Xzu
 cr3nf6iVK8leN4r7A2TYqbA0lJnV4U
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] net: stmmac: dwc-qos: Make struct
	dwc_eth_dwmac_data::remove return void
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

QWxsIGltcGxlbWVudGF0aW9ucyBvZiB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiAwIHVuY29u
ZGl0aW9uYWxseS4gU28KaW4gZHdjX2V0aF9kd21hY19yZW1vdmUoKSB0aGVyZSBpcyBubyBlcnJv
ciBoYW5kbGluZyBuZWNlc3NhcnkuIFNpbXBsaWZ5CmFjY29yZGluZ2x5LgoKVGhpcyBpcyBhIHBy
ZXBhcmF0aW9uIGZvciBtYWtpbmcgc3RydWN0IHBsYXRmb3JtX2RyaXZlcjo6cmVtb3ZlIHJldHVy
bgp2b2lkLCB0b28uCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1kd2MtcW9zLWV0aC5jIHwgMTcgKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWR3Yy1xb3MtZXRoLmMgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1kd2MtcW9zLWV0aC5jCmluZGV4IDg3
YTJjMWExODYzOC4uMThhY2Y3ZGQ3NGU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1kd2MtcW9zLWV0aC5jCisrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWR3Yy1xb3MtZXRoLmMKQEAgLTE1OSwxNSArMTU5
LDEzIEBAIHN0YXRpYyBpbnQgZHdjX3Fvc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LAogCXJldHVybiBlcnI7CiB9CiAKLXN0YXRpYyBpbnQgZHdjX3Fvc19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIGR3Y19xb3NfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYgPSBw
bGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYgPSBu
ZXRkZXZfcHJpdihuZGV2KTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5wbGF0LT5w
Y2xrKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+cGxhdC0+c3RtbWFjX2Nsayk7Ci0K
LQlyZXR1cm4gMDsKIH0KIAogI2RlZmluZSBTRE1FTUNPTVBQQURDVFJMIDB4ODgwMApAQCAtMzg0
LDcgKzM4Miw3IEBAIHN0YXRpYyBpbnQgdGVncmFfZXFvc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2LAogCXJldHVybiBlcnI7CiB9CiAKLXN0YXRpYyBpbnQgdGVncmFfZXFvc19y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHRlZ3JhX2Vx
b3NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHRlZ3Jh
X2Vxb3MgKmVxb3MgPSBnZXRfc3RtbWFjX2JzcF9wcml2KCZwZGV2LT5kZXYpOwogCkBAIC0zOTQs
MTUgKzM5MiwxMyBAQCBzdGF0aWMgaW50IHRlZ3JhX2Vxb3NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGVxb3MtPmNsa19yeCk7CiAJ
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGVxb3MtPmNsa19zbGF2ZSk7CiAJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGVxb3MtPmNsa19tYXN0ZXIpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0cnVjdCBkd2Nf
ZXRoX2R3bWFjX2RhdGEgewogCWludCAoKnByb2JlKShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LAogCQkgICAgIHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqZGF0YSwKIAkJICAgICBz
dHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyAqcmVzKTsKLQlpbnQgKCpyZW1vdmUpKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpOworCXZvaWQgKCpyZW1vdmUpKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpOwogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkd2NfZXRoX2R3bWFjX2RhdGEg
ZHdjX3Fvc19kYXRhID0gewpAQCAtNDczLDE5ICs0NjksMTYgQEAgc3RhdGljIGludCBkd2NfZXRo
X2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBuZXRf
ZGV2aWNlICpuZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IHN0bW1h
Y19wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7CiAJY29uc3Qgc3RydWN0IGR3Y19ldGhf
ZHdtYWNfZGF0YSAqZGF0YTsKLQlpbnQgZXJyOwogCiAJZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hf
ZGF0YSgmcGRldi0+ZGV2KTsKIAogCXN0bW1hY19kdnJfcmVtb3ZlKCZwZGV2LT5kZXYpOwogCi0J
ZXJyID0gZGF0YS0+cmVtb3ZlKHBkZXYpOwotCWlmIChlcnIgPCAwKQotCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJmYWlsZWQgdG8gcmVtb3ZlIHN1YmRyaXZlcjogJWRcbiIsIGVycik7CisJZGF0YS0+
cmVtb3ZlKHBkZXYpOwogCiAJc3RtbWFjX3JlbW92ZV9jb25maWdfZHQocGRldiwgcHJpdi0+cGxh
dCk7CiAKLQlyZXR1cm4gZXJyOworCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBkd2NfZXRoX2R3bWFjX21hdGNoW10gPSB7Ci0tIAoyLjM5LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
