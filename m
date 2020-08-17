Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12422246BF8
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Aug 2020 18:06:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B138DC32E8F;
	Mon, 17 Aug 2020 16:06:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91057C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Aug 2020 16:06:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAD9520729;
 Mon, 17 Aug 2020 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597680376;
 bh=i8IA/7eMak21kEfbh371Ez3qa987IvxjDxAcvdOsJVc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gryMVdy4dWOB1MV19b0ijpmo3x5gFAwmcuB8isSqsvUSJ8WXzuoNcDp/4xzu306ue
 qbsZp8/Bkp98Zv9UxWP5/gzPgmKGitJotwdIfuovnBcMHQImq2e4HDx13TQHFvDNXE
 Kh6ZXK8Op/RGOIX2gNU3C4yHcLOhNSLT15Miw7f4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Date: Mon, 17 Aug 2020 17:15:33 +0200
Message-Id: <20200817143802.365269820@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817143755.807583758@linuxfoundation.org>
References: <20200817143755.807583758@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5.4 132/270] drm/stm: repair runtime power
	management
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

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+CgpbIFVwc3RyZWFtIGNvbW1pdCBlYmQy
NjdiMmUzYzI1ZDVmOTNhMDg1MjhiNDdjMDM2NTY5ZWI4NzQ0IF0KCkFkZCBtaXNzaW5nIHBtX3J1
bnRpbWVfZ2V0X3N5bmMoKSBpbnRvIGx0ZGNfY3J0Y19hdG9taWNfZW5hYmxlKCkgdG8KbWF0Y2gg
cG1fcnVudGltZV9wdXRfc3luYygpIGluIGx0ZGNfY3J0Y19hdG9taWNfZGlzYWJsZSgpLCBvdGhl
cndpc2UKdGhlIExUREMgbWlnaHQgc3VzcGVuZCB2aWEgcnVudGltZSBQTSwgZGlzYWJsZSBjbG9j
aywgYW5kIHRoZW4gZmFpbAp0byByZXN1bWUgbGF0ZXIgb24uCgpUaGUgdGVzdCB3aGljaCB0cmln
Z2VycyBpdCBpcyByb3VnaGx5IC0tIHJ1biBxdDUgYXBwbGljYXRpb24gd2hpY2gKdXNlcyBlZ2xm
cyBwbGF0Zm9ybSBhbmQgZXRuYXZpdiwgc3RvcCB0aGUgYXBwbGljYXRpb24sIHNsZWVwIGZvciAx
NQptaW51dGVzLCBydW4gdGhlIGFwcGxpY2F0aW9uIGFnYWluLiBUaGlzIGxlYWRzIHRvIGEgdGlt
ZW91dCB3YWl0aW5nCmZvciB2c3luYywgYmVjYXVzZSB0aGUgTFREQyBoYXMgc3VzcGVuZGVkLCBi
dXQgZGlkIG5vdCByZXN1bWUuCgpGaXhlczogMzVhYjZjZmJmMjExICgiZHJtL3N0bTogc3VwcG9y
dCBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQiKQpTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8
bWFyZXhAZGVueC5kZT4KQ2M6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29t
PgpDYzogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4KQ2M6IEJlbmphbWlu
IEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpDYzogVmluY2VudCBBYnJp
b3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4KQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGlu
LnN0bTMyQGdtYWlsLmNvbT4KQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVA
c3QuY29tPgpUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCkFja2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVA
c3QuY29tPgpUZXN0ZWQtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+
ClNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5j
b20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8y
MDIwMDIyOTIyMTY0OS45MDgxMy0xLW1hcmV4QGRlbnguZGUKU2lnbmVkLW9mZi1ieTogU2FzaGEg
TGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5j
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCmlu
ZGV4IDNhYjRmYmY4ZWIwZDEuLjUxNTcxZjcyNDZhYmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9zdG0vbHRkYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCkBAIC00MjQs
OSArNDI0LDEyIEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKIAkJCQkgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfc3RhdGUp
CiB7CiAJc3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190b19sdGRjKGNydGMpOworCXN0
cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gY3J0Yy0+ZGV2OwogCiAJRFJNX0RFQlVHX0RSSVZFUigi
XG4iKTsKIAorCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZGRldi0+ZGV2KTsKKwogCS8qIFNldHMgdGhl
IGJhY2tncm91bmQgY29sb3IgdmFsdWUgKi8KIAlyZWdfd3JpdGUobGRldi0+cmVncywgTFREQ19C
Q0NSLCBCQ0NSX0JDQkxBQ0spOwogCi0tIAoyLjI1LjEKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
