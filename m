Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F856ADE2C
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Mar 2023 12:59:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E02CC65E5A;
	Tue,  7 Mar 2023 11:59:25 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 184ACC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Mar 2023 11:59:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZVyL-0006Zh-9v; Tue, 07 Mar 2023 12:59:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZVyJ-002TG9-T3; Tue, 07 Mar 2023 12:59:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZVyI-002yk2-QP; Tue, 07 Mar 2023 12:59:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Dan Carpenter <error27@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Tue,  7 Mar 2023 12:58:52 +0100
Message-Id: <20230307115900.2293120-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=nLjrzhFMDWv8vjI/TpGtzSepyHgqVbB8jO7N9V2rgSw=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBybdOJzEP8Mob8O1vUcByQ02bBPElIp2nyn3N
 cOH8KuWARqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcm3QAKCRDB/BR4rcrs
 CSImB/0QNjaVQMfaMmv9zoXO2BF5RJ3RtN4ps6lvW09LJnzFzRScIA1pFNDkn2wLqVhrjPTw4IG
 7C7uLxIgU1BMy6fWqpkzjRR8ztgrR/+4885Xngv6Yin0x4mAZcI51zgj7mUz4WvI0FNOvWtyg2i
 8aMlJ9VIVEL+R8V3GSGZtTvp3V2IWr5peSxD5iYBlnO0MKww2BjLi3PJqyhIZatKMRZH1sZkM1i
 KAIku6iysvLYWW5wmdt7fwol1ypU9gWEljfdc8u4tsMtvxB0Rz53bLPNf1Vx/3QIv66bVlx8m39
 lehCOOGjr+SF1YsUORJO+CwfDq04HMMLZFKVw/sPPBT96XgM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 23/31] phy: st: phy-stm32-usbphyc: Convert to
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
dmVycy9waHkvc3QvcGh5LXN0bTMyLXVzYnBoeWMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGh5L3N0L3BoeS1zdG0zMi11c2JwaHljLmMgYi9kcml2ZXJzL3BoeS9zdC9waHktc3RtMzItdXNi
cGh5Yy5jCmluZGV4IDViYjk2NDdiMDc4Zi4uMWFkZDNiNzVmOTJmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3BoeS9zdC9waHktc3RtMzItdXNicGh5Yy5jCisrKyBiL2RyaXZlcnMvcGh5L3N0L3BoeS1z
dG0zMi11c2JwaHljLmMKQEAgLTc2Niw3ICs3NjYsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3VzYnBo
eWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQog
Ci1zdGF0aWMgaW50IHN0bTMyX3VzYnBoeWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCitzdGF0aWMgdm9pZCBzdG0zMl91c2JwaHljX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBzdG0zMl91c2JwaHljICp1c2JwaHljID0gZGV2X2dl
dF9kcnZkYXRhKCZwZGV2LT5kZXYpOwogCWludCBwb3J0OwpAQCAtNzc5LDggKzc3OSw2IEBAIHN0
YXRpYyBpbnQgc3RtMzJfdXNicGh5Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAlzdG0zMl91c2JwaHljX2NsazQ4X3VucmVnaXN0ZXIodXNicGh5Yyk7CiAKIAljbGtfZGlz
YWJsZV91bnByZXBhcmUodXNicGh5Yy0+Y2xrKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMg
aW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3VzYnBoeWNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRl
dikKQEAgLTgxMCw3ICs4MDgsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdG0zMl91c2Jw
aHljX29mX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfdXNi
cGh5Y19kcml2ZXIgPSB7CiAJLnByb2JlID0gc3RtMzJfdXNicGh5Y19wcm9iZSwKLQkucmVtb3Zl
ID0gc3RtMzJfdXNicGh5Y19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdG0zMl91c2JwaHljX3Jl
bW92ZSwKIAkuZHJpdmVyID0gewogCQkub2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl91c2JwaHljX29m
X21hdGNoLAogCQkubmFtZSA9ICJzdG0zMi11c2JwaHljIiwKLS0gCjIuMzkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
