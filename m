Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7D16AA15E
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 22:37:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAE0DC6A61A;
	Fri,  3 Mar 2023 21:37:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5312C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 21:37:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYD5w-0000NX-Hl; Fri, 03 Mar 2023 22:37:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYD5v-001eCY-3U; Fri, 03 Mar 2023 22:37:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYD5u-001wzB-CA; Fri, 03 Mar 2023 22:37:38 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  3 Mar 2023 22:37:15 +0100
Message-Id: <20230303213716.2123717-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7BLjEAE+OMR4vcRLdtu8fbKtU1EdPh6RPJWc/ir7b/0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmiCCHlZhBDExndJ5m6lx0wuc8QePPa20UA98
 P6qVFb7UF6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoggAKCRDB/BR4rcrs
 Ce8lB/9hwoU4opbIZHMZsgS3Z8HcBKf0uHx/7pm9CDNVex/0uLwAE1H1KMZxpjHXMYPCOJ3NBxE
 x7JjZGZGCCrub8vaYQLn/OCQ20S4PPLyniXXPFteu0lgqxxLk2z7fbMMZue3ctXwGmZD9M3UcB2
 HdZOuRUyD6dwtoXswmAn3hHyTry37KEaFuslVjJAad+9fRuJ2XQJ5P0RGRZcDwOB/ciKHeqx5Bt
 N1b9qsd+i5EVMCi88Bmmq+ykhkX2pqn488i6cQeymdT2/Pdve1wIsoRtysde6tnEmkCCxbgqtBh
 LVJbn3W/Z2tFN78SGN/nP6klYZWs7IL9HhGpQYL5tKvgTd2N
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 33/34] watchdog: stmp3xxx_rtc: Convert to
	platform remove callback returning void
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy93YXRjaGRvZy9zdG1wM3h4eF9ydGNfd2R0LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
d2F0Y2hkb2cvc3RtcDN4eHhfcnRjX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9zdG1wM3h4eF9y
dGNfd2R0LmMKaW5kZXggN2NhZjNhYTcxYzZhLi40YjJjYWE5ODA3YWMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvd2F0Y2hkb2cvc3RtcDN4eHhfcnRjX3dkdC5jCisrKyBiL2RyaXZlcnMvd2F0Y2hkb2cv
c3RtcDN4eHhfcnRjX3dkdC5jCkBAIC0xMDksMTAgKzEwOSw5IEBAIHN0YXRpYyBpbnQgc3RtcDN4
eHhfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9
CiAKLXN0YXRpYyBpbnQgc3RtcDN4eHhfd2R0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQorc3RhdGljIHZvaWQgc3RtcDN4eHhfd2R0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogewogCXVucmVnaXN0ZXJfcmVib290X25vdGlmaWVyKCZ3ZHRfbm90aWZp
ZXIpOwotCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bXAzeHh4
X3dkdF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKQEAgLTE0NCw3ICsxNDMsNyBAQCBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG1wM3h4eF93ZHRfZHJpdmVyID0gewogCQkucG0g
PSAmc3RtcDN4eHhfd2R0X3BtX29wcywKIAl9LAogCS5wcm9iZSA9IHN0bXAzeHh4X3dkdF9wcm9i
ZSwKLQkucmVtb3ZlID0gc3RtcDN4eHhfd2R0X3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IHN0bXAz
eHh4X3dkdF9yZW1vdmUsCiB9OwogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihzdG1wM3h4eF93ZHRf
ZHJpdmVyKTsKIAotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
