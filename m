Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E73441E0
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 13:37:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C99FC57B5B;
	Mon, 22 Mar 2021 12:37:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B158AC5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 12:37:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 436CD619A0;
 Mon, 22 Mar 2021 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616416646;
 bh=qZ8CtAubEETq0hjuoxRlHxWl/vHQSMOfCTA7Kp6wJwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oYYkk8FELbgLOVmQUv6gJ2DulxAV1wfnX51aHQv3rbXxNRs6mVptSiDXTM0S8Ko1J
 tffDo++S+uOZg6c9FQpNL7rDS6oybzlCy5NugJ/PGA3NrlmuSudyfeOHs2SIQCnlKG
 xvUKSVC9DFfbwCitjh2e4NMZINJTkX715b6uHvo0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 22 Mar 2021 13:27:02 +0100
Message-Id: <20210322121935.827607612@linuxfoundation.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322121933.746237845@linuxfoundation.org>
References: <20210322121933.746237845@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Sasha Levin <sashal@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Gerald Baeza <gerald.baeza@st.com>, Lee Jones <lee.jones@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 5.10 065/157] tty: serial: stm32-usart: Remove
	set but unused cookie variables
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

RnJvbTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KClsgVXBzdHJlYW0gY29tbWl0
IDI0ODMyY2EzZWU4NWExNGM0MmE0ZjIzYTVjODg0MWVmNWRiM2QwMjkgXQoKRml4ZXMgdGhlIGZv
bGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy90dHkvc2VyaWFs
L3N0bTMyLXVzYXJ0LmM6IEluIGZ1bmN0aW9uIOKAmHN0bTMyX3RyYW5zbWl0X2NoYXJzX2RtYeKA
mToKIGRyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jOjM1MzoxNTogd2FybmluZzogdmFy
aWFibGUg4oCYY29va2ll4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYzogSW4gZnVuY3Rpb24g4oCY
c3RtMzJfb2ZfZG1hX3J4X3Byb2Jl4oCZOgogZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0
LmM6MTA5MDoxNTogd2FybmluZzogdmFyaWFibGUg4oCYY29va2ll4oCZIHNldCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IEppcmkgU2xhYnkgPGppcmlzbGFieUBrZXJu
ZWwub3JnPgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgpD
YzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+CkNjOiBHZXJhbGQg
QmFlemEgPGdlcmFsZC5iYWV6YUBzdC5jb20+CkNjOiBsaW51eC1zZXJpYWxAdmdlci5rZXJuZWwu
b3JnCkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tClNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ckxpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyMDExMDQxOTM1NDkuNDAyNjE4Ny0yOS1sZWUuam9uZXNAbGluYXJv
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
Ci0tLQogZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgfCA2ICsrLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0z
Mi11c2FydC5jCmluZGV4IGVlNmM3NzYyZDM1NS4uZjRkZTMyZDNmMmFmIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwv
c3RtMzItdXNhcnQuYwpAQCAtMzUwLDcgKzM1MCw2IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3RyYW5z
bWl0X2NoYXJzX2RtYShzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQogCXN0cnVjdCBzdG0zMl91c2Fy
dF9vZmZzZXRzICpvZnMgPSAmc3RtMzJwb3J0LT5pbmZvLT5vZnM7CiAJc3RydWN0IGNpcmNfYnVm
ICp4bWl0ID0gJnBvcnQtPnN0YXRlLT54bWl0OwogCXN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3Jp
cHRvciAqZGVzYyA9IE5VTEw7Ci0JZG1hX2Nvb2tpZV90IGNvb2tpZTsKIAl1bnNpZ25lZCBpbnQg
Y291bnQsIGk7CiAKIAlpZiAoc3RtMzJwb3J0LT50eF9kbWFfYnVzeSkKQEAgLTM5NCw3ICszOTMs
NyBAQCBzdGF0aWMgdm9pZCBzdG0zMl90cmFuc21pdF9jaGFyc19kbWEoc3RydWN0IHVhcnRfcG9y
dCAqcG9ydCkKIAlkZXNjLT5jYWxsYmFja19wYXJhbSA9IHBvcnQ7CiAKIAkvKiBQdXNoIGN1cnJl
bnQgRE1BIFRYIHRyYW5zYWN0aW9uIGluIHRoZSBwZW5kaW5nIHF1ZXVlICovCi0JY29va2llID0g
ZG1hZW5naW5lX3N1Ym1pdChkZXNjKTsKKwlkbWFlbmdpbmVfc3VibWl0KGRlc2MpOwogCiAJLyog
SXNzdWUgcGVuZGluZyBETUEgVFggcmVxdWVzdHMgKi8KIAlkbWFfYXN5bmNfaXNzdWVfcGVuZGlu
ZyhzdG0zMnBvcnQtPnR4X2NoKTsKQEAgLTEwODcsNyArMTA4Niw2IEBAIHN0YXRpYyBpbnQgc3Rt
MzJfb2ZfZG1hX3J4X3Byb2JlKHN0cnVjdCBzdG0zMl9wb3J0ICpzdG0zMnBvcnQsCiAJc3RydWN0
IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgZG1hX3NsYXZlX2NvbmZpZyBjb25m
aWc7CiAJc3RydWN0IGRtYV9hc3luY190eF9kZXNjcmlwdG9yICpkZXNjID0gTlVMTDsKLQlkbWFf
Y29va2llX3QgY29va2llOwogCWludCByZXQ7CiAKIAkvKiBSZXF1ZXN0IERNQSBSWCBjaGFubmVs
ICovCkBAIC0xMTMyLDcgKzExMzAsNyBAQCBzdGF0aWMgaW50IHN0bTMyX29mX2RtYV9yeF9wcm9i
ZShzdHJ1Y3Qgc3RtMzJfcG9ydCAqc3RtMzJwb3J0LAogCWRlc2MtPmNhbGxiYWNrX3BhcmFtID0g
TlVMTDsKIAogCS8qIFB1c2ggY3VycmVudCBETUEgdHJhbnNhY3Rpb24gaW4gdGhlIHBlbmRpbmcg
cXVldWUgKi8KLQljb29raWUgPSBkbWFlbmdpbmVfc3VibWl0KGRlc2MpOworCWRtYWVuZ2luZV9z
dWJtaXQoZGVzYyk7CiAKIAkvKiBJc3N1ZSBwZW5kaW5nIERNQSByZXF1ZXN0cyAqLwogCWRtYV9h
c3luY19pc3N1ZV9wZW5kaW5nKHN0bTMycG9ydC0+cnhfY2gpOwotLSAKMi4zMC4xCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
