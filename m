Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B524AC771
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 18:30:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2289C60460;
	Mon,  7 Feb 2022 17:30:37 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 146A5C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 17:30:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nGzDB-00062Y-7R; Mon, 07 Feb 2022 09:17:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nGzDA-00F3aj-1U; Mon, 07 Feb 2022 09:17:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nGzD8-00ANfg-FB; Mon, 07 Feb 2022 09:17:22 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon,  7 Feb 2022 09:17:09 +0100
Message-Id: <20220207081709.27288-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766; h=from:subject;
 bh=U6+lWWPmvSZmtADyREDLbI8cQd9NgkKUAA+ihpaCGuw=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiANV/3LDMskuD9hlsssYfPrY5Z6oZAFdy4c2rVkVU
 pnTRxQKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYgDVfwAKCRDB/BR4rcrsCVlKB/
 9QsGMhDj4Rd5PUIzXmFVPx16oPKv7K99HwhiaXM6mSvH56j+86WWKTQDpn/AA+yh2urc+WPNvU0UvW
 z3JDl21o+p+c0l2XJE5mHHJo4zRFhgTOoEY9HgjveFhCfnyzCgXBtufzdldY1CBWpp9QD2GG37u0zP
 fc7bSyxjUXiPXpXz2wI+BxSse3B29Aqw1cJEmAMGoiBWagOkuw2ss6KZZ0/QuMkI+yQcNPtlc4qQfD
 1qxY6bnSRLqJziZhPnbnAgAuHnfeW9IkRk3AkSD3pQyPwWXVZYwMTb9SigWJAuefqVDa0nDCa7zVUG
 cFXnHBu3pCyiARsAP8sDfWWshTGxyV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] mfd: stmfx: Improve error message triggered
	by regulator fault in .remove()
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

UmV0dXJuaW5nIGEgbm9uLXplcm8gdmFsdWUgaW4gYW4gaTJjIHJlbW92ZSBjYWxsYmFjayByZXN1
bHRzIGluIHRoZSBpMmMKY29yZSBlbWl0dGluZyBhIHZlcnkgZ2VuZXJpYyBlcnJvciBtZXNzYWdl
ICgicmVtb3ZlIGZhaWxlZCAoLUVTT01FVEhJTkcpLAp3aWxsIGJlIGlnbm9yZWQiKSBhbmQgYXMg
dGhlIG1lc3NhZ2UgaW5kaWNhdGVzIG5vdCBmdXJ0aGVyIGVycm9yIGhhbmRsaW5nCmlzIGRvbmUu
CgpJbnN0ZWFkIGVtaXQgYSBtb3JlIHNwZWNpZmljIGVycm9yIG1lc3NhZ2UgYW5kIHRoZW4gcmV0
dXJuIHplcm8gaW4KLnJlbW92ZSgpLgoKVGhlIGxvbmctdGVybSBnb2FsIGlzIHRvIG1ha2UgdGhl
IGkyYyByZW1vdmUgcHJvdG90eXBlIHJldHVybiB2b2lkLCBtYWtpbmcKYWxsIGltcGxlbWVudGF0
aW9ucyByZXR1cm4gMCBpcyBwcmVwYXJhdG9yeSB3b3JrIGZvciB0aGlzIGNoYW5nZS4KClNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+Ci0tLQogZHJpdmVycy9tZmQvc3RtZnguYyB8IDE2ICsrKysrKysrKysrLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWZkL3N0bWZ4LmMgYi9kcml2ZXJzL21mZC9zdG1meC5jCmluZGV4IGUwOTVhMzkz
MDE0Mi4uMTY2MzFjNjc1ZjJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL21mZC9zdG1meC5jCisrKyBi
L2RyaXZlcnMvbWZkL3N0bWZ4LmMKQEAgLTM5MiwxNyArMzkyLDIxIEBAIHN0YXRpYyBpbnQgc3Rt
ZnhfY2hpcF9pbml0KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiAJcmV0dXJuIHJldDsKIH0K
IAotc3RhdGljIGludCBzdG1meF9jaGlwX2V4aXQoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkK
K3N0YXRpYyB2b2lkIHN0bWZ4X2NoaXBfZXhpdChzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQog
ewogCXN0cnVjdCBzdG1meCAqc3RtZnggPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsKIAog
CXJlZ21hcF93cml0ZShzdG1meC0+bWFwLCBTVE1GWF9SRUdfSVJRX1NSQ19FTiwgMCk7CiAJcmVn
bWFwX3dyaXRlKHN0bWZ4LT5tYXAsIFNUTUZYX1JFR19TWVNfQ1RSTCwgMCk7CiAKLQlpZiAoc3Rt
ZngtPnZkZCkKLQkJcmV0dXJuIHJlZ3VsYXRvcl9kaXNhYmxlKHN0bWZ4LT52ZGQpOworCWlmIChz
dG1meC0+dmRkKSB7CisJCWludCByZXQgPSByZWd1bGF0b3JfZGlzYWJsZShzdG1meC0+dmRkKTsK
IAotCXJldHVybiAwOworCQlpZiAocmV0KQorCQkJZGV2X2VycigmY2xpZW50LT5kZXYsCisJCQkJ
IkZhaWxlZCB0byBkaXNhYmxlIHZkZCByZWd1bGF0b3I6ICVwZVxuIiwKKwkJCQlFUlJfUFRSKHJl
dCkpOworCX0KIH0KIAogc3RhdGljIGludCBzdG1meF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50LApAQCAtNDY2LDcgKzQ3MCw5IEBAIHN0YXRpYyBpbnQgc3RtZnhfcmVtb3ZlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQpCiB7CiAJc3RtZnhfaXJxX2V4aXQoY2xpZW50KTsKIAotCXJl
dHVybiBzdG1meF9jaGlwX2V4aXQoY2xpZW50KTsKKwlzdG1meF9jaGlwX2V4aXQoY2xpZW50KTsK
KworCXJldHVybiAwOwogfQogCiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQCgpiYXNlLWNvbW1pdDog
ZGNiODVmODVmYTZmMTQyYWFlMWZlODZmMzk5ZDQ1MDNkNDlmMmI2MAotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
