Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9C78B3E6
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 17:02:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73797C6A617;
	Mon, 28 Aug 2023 15:02:32 +0000 (UTC)
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com
 [203.205.221.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 266F6C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693234931;
 bh=jSltvEstbop3NROWcEwdZJbmP1v8gLHUw94pJQsaf3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Tm8UQcVzVZ5QkrqahJ1xpWtHqOcVG+1n5LS1hwtgX4CFcWozf+XS6JvRNNWcLurdi
 7UoAb5pwaT3TKiyDQXMwDw10f5GBgYlls8ksQmD5JVvdrADX76gDg0w0sK+VcJcckN
 glqPz+FBqiVFjki5znOosCSnDtU7N0j5TDU/+89c=
Received: from localhost.localdomain ([122.14.229.192])
 by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
 id 8738A04; Mon, 28 Aug 2023 23:02:07 +0800
X-QQ-mid: xmsmtpt1693234927t8a1x7jf4
Message-ID: <tencent_CF6E986A75B63EC09E3D98143650B5241809@qq.com>
X-QQ-XMAILINFO: MeK9O+zTyEgNs+LeEp8wuw1W+ZzSO1xt89C05fPo+KhYxR40w2ZLaCnt7UoQYP
 1LsuFXgH5yk7FsRZrDt/fIqNHWDOhKl6e2a/0KP79uUqIyBDmpSauM746pTQOXM0KfZy1ScFdJqr
 fQyr5SmAeTi5MmtXu34Qpz7M4eJ5Kto6Pr5NJtr1EPjoM6bvBtp6U1ClinRqyXslYpYUPLOe9C4Z
 3xfrahIgwaHA2wkKlwsILr4K3raS7jtQ+FGWoQ2ocpAOrhJNt1SG1o6vXXLcW2YT/sr2AKFphzLN
 OXviIH2CZueQR5hK89KyIHIitiQsEFCoJKX5jZZ36Dkvd8dtfoOnvTr/BBBE/D4Y94lnJICStTYf
 8Aw7fkCbWa6O0FthHHmmCof9Wh9ckxPLO1mOHJZLMLNUurTX+GWUuQKJY4MrVLpZREhJ1rDcvPMp
 qjetfGoM7hTH5XXEjcTt3JDE36uDURCN7ktDrOXH/UQeiX1GB8IMnlSKJ2srdKyOz2JLsPGA5T9c
 eu4kT5GD95hEtRwOm9VKP/bu3jCWy7TuDvg99h509XaHKPpDRQwUIcOSvLQCUxdG23Eg089Y/HEZ
 1MqtHrKRjEJgDufwyYJ7M6YyTpvk0zsJ3OfnQxUnDB3xZYVn8+NPsRtbqfv30hcrD+nXTTvo86oa
 wfeel8s2T0+O9T701m0O4tHVTX9UWd5N/1qyize4oHfs2kRfiFV3K14qumHpFwN22EePVBDtJMNP
 Je/fK5yYmUbmOsr5wR5aQ2w437Tetulqbzkpc2g75iOzlgsMs+qthpa150x/3hvYkqdHgXIPY7M+
 gbWptpFW4o+7xprMGGO39en5bcSpFnPav2S0xOCsa4syW+CFzohnSH5yjdXhUKeMiiq7IEoumbeC
 YO6FyTNE/ew2PV/95/EvgleJn8LPvxyBsMsa0FL+nZ3qqjoloNqocUUIkRVmggK/rckR0nzudnx0
 ZmvKRi5lfafiV3ojyvJjbaw10zZ0hASq0pEr0gxc0xFvrAKcGYAdhaqTX6pDFM
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Date: Mon, 28 Aug 2023 23:02:07 +0800
X-OQ-MSGID: <5984351.lOV4Wx5bFT@localhost.localdomain>
In-Reply-To: <20230716170821.3305e3fa@jic23-huawei>
References: <tencent_994DA85912C937E3B5405BA960B31ED90A08@qq.com>
 <20230716170821.3305e3fa@jic23-huawei>
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH] io: adc: stm32-adc: fix potential NULL
 pointer dereference in stm32_adc_probe()
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

5ZyoIDIwMjPlubQ35pyIMTfml6XmmJ/mnJ/kuIAgQ1NUIOS4iuWNiDEyOjA4OjIx77yMSm9uYXRo
YW4gQ2FtZXJvbiDlhpnpgZPvvJoKPiBPbiBTYXQsIDE1IEp1bCAyMDIzIDIzOjU1OjUwICswODAw
Cj4gCj4gWmhhbmcgU2h1cm9uZyA8emhhbmdfc2h1cm9uZ0Bmb3htYWlsLmNvbT4gd3JvdGU6Cj4g
PiBvZl9tYXRjaF9kZXZpY2UoKSBtYXkgZmFpbCBhbmQgcmV0dXJucyBhIE5VTEwgcG9pbnRlci4K
PiA+IAo+ID4gRml4IHRoaXMgYnkgY2hlY2tpbmcgdGhlIHJldHVybiB2YWx1ZSBvZiBvZl9tYXRj
aF9kZXZpY2UoKS4KPiA+IAo+ID4gRml4ZXM6IDY0YWQ3ZjY0MzhmMyAoImlpbzogYWRjOiBzdG0z
MjogaW50cm9kdWNlIGNvbXBhdGlibGUgZGF0YSBjZmciKQo+ID4gU2lnbmVkLW9mZi1ieTogWmhh
bmcgU2h1cm9uZyA8emhhbmdfc2h1cm9uZ0Bmb3htYWlsLmNvbT4KPiAKPiBIaSBaaGFuZywKPiAK
PiBJJ20gbm90IHN1cmUgd2UgY2FuIGFjdHVhbGx5IG1ha2UgdGhpcyBidWcgaGFwcGVuLiBEbyB5
b3UgaGF2ZQo+IGEgd2F5IG9mIHRyaWdnZXJpbmcgaXQ/ICBUaGUgZHJpdmVyIGlzIG9ubHkgcHJv
YmVkIG9uIGRldmljZXMgd2hlcmUKPiB0aGF0IG1hdGNoIHdpbGwgd29yay4KPiAKPiBBbHNvLCBh
c3N1bWluZyB0aGUgbWF0Y2ggdGFibGUgaXMgdGhlIHNhbWUgb25lIGFzc29jaWF0ZWQgd2l0aCB0
aGlzIHByb2JlCj4gZnVuY3Rpb24sIHRoZW4gdXMgcHJpdi0+Y2ZnID0gb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKCkgYW5kIGNoZWNrIHRoZQo+IG91dHB1dCBvZiB0aGF0IHdoaWNoIGlzIHdoYXQg
d2UgcmVhbGx5IGNhcmUgYWJvdXQuCj4gCj4gSm9uYXRoYW4KPiAKPiA+IC0tLQo+ID4gCj4gPiAg
ZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3JlLmMgfCA5ICsrKysrKystLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUuYwo+ID4gYi9kcml2ZXJzL2lp
by9hZGMvc3RtMzItYWRjLWNvcmUuYyBpbmRleCA0OGYwMmRjYzgxYzEuLjcwMDExZmRiZjVmNgo+
ID4gMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLWNvcmUuYwo+ID4g
KysrIGIvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy1jb3JlLmMKPiA+IEBAIC03MDYsNiArNzA2
LDggQEAgc3RhdGljIGludCBzdG0zMl9hZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+
ID4gKnBkZXYpPiAKPiA+ICAJc3RydWN0IHN0bTMyX2FkY19wcml2ICpwcml2Owo+ID4gIAlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ID4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
ID0gcGRldi0+ZGV2Lm9mX25vZGU7Cj4gPiAKPiA+ICsJY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCAqb2ZfaWQ7Cj4gPiArCj4gPiAKPiA+ICAJc3RydWN0IHJlc291cmNlICpyZXM7Cj4gPiAgCXUz
MiBtYXhfcmF0ZTsKPiA+ICAJaW50IHJldDsKPiA+IAo+ID4gQEAgLTcxOCw4ICs3MjAsMTEgQEAg
c3RhdGljIGludCBzdG0zMl9hZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+ID4gKnBk
ZXYpPiAKPiA+ICAJCXJldHVybiAtRU5PTUVNOwo+ID4gIAkKPiA+ICAJcGxhdGZvcm1fc2V0X2Ry
dmRhdGEocGRldiwgJnByaXYtPmNvbW1vbik7Cj4gPiAKPiA+IC0JcHJpdi0+Y2ZnID0gKGNvbnN0
IHN0cnVjdCBzdG0zMl9hZGNfcHJpdl9jZmcgKikKPiA+IC0JCW9mX21hdGNoX2RldmljZShkZXYt
PmRyaXZlci0+b2ZfbWF0Y2hfdGFibGUsIGRldiktPmRhdGE7Cj4gPiArCW9mX2lkID0gb2ZfbWF0
Y2hfZGV2aWNlKGRldi0+ZHJpdmVyLT5vZl9tYXRjaF90YWJsZSwgZGV2KTsKPiA+ICsJaWYgKCFv
Zl9pZCkKPiA+ICsJCXJldHVybiAtRU5PREVWOwo+ID4gKwo+ID4gKwlwcml2LT5jZmcgPSAoY29u
c3Qgc3RydWN0IHN0bTMyX2FkY19wcml2X2NmZyAqKW9mX2lkLT5kYXRhOwo+ID4gCj4gPiAgCXBy
aXYtPm5iX2FkY19tYXggPSBwcml2LT5jZmctPm51bV9hZGNzOwo+ID4gIAlzcGluX2xvY2tfaW5p
dCgmcHJpdi0+Y29tbW9uLmxvY2spOwpIZWxsbyBKb25hdGhhbiwKCkkgdGhpbmsgd2UgY2FuIG1h
a2UgaXQgaGFwcGVuIGJ5IGRlc2lnbmluZyB0aGUgcGxhdGZvcm0gZGV2aWNlIGluIGEgd2F5IHRo
YXQgCml0cyBuYW1lIGFsaWducyB3aXRoIHRoYXQgb2YgdGhlIGRyaXZlci4gSW4gc3VjaCBhIHNj
ZW5hcmlvLCB3aGVuIHRoZSBkcml2ZXIgCmlzIHByb2JlZCwgdGhlIG9mX21hdGNoX2RldmljZSBm
dW5jdGlvbiB3aWxsIHJldHVybiBudWxsLiBZb3UgY2FuIHZlcmlmeSB0aGlzIApmdW5jdGlvbmFs
aXR5IGJ5IHJldmlld2luZyB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uOgoKc3RhdGljIGludCBwbGF0
Zm9ybV9tYXRjaChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYp
CgpCZXN0IHJlZ2FyZHMsClNodXJvbmcKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
