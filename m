Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9374B2A64AB
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 13:52:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AF99C36B36;
	Wed,  4 Nov 2020 12:52:16 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF497C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 12:52:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CR64F6dy5z1rxXl;
 Wed,  4 Nov 2020 13:52:13 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CR64F5JHDz1qwm0;
 Wed,  4 Nov 2020 13:52:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id yRjIT8PYsG6G; Wed,  4 Nov 2020 13:52:12 +0100 (CET)
X-Auth-Info: 330ErkJ8ipbWk2iQgph/8v29aMRCJ8Rgq1daKFr7MdI=
Received: from localhost.localdomain (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  4 Nov 2020 13:52:12 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed,  4 Nov 2020 13:52:00 +0100
Message-Id: <20201104125200.259639-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [Linux-stm32] [PATCH] drm/stm: Enable RPM during fbdev registration
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

RW5hYmxlIHJ1bnRpbWUgUE0gYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBmYmRldiBlbXVsYXRpb24g
YW5kIGRpc2FibGUgaXQKYWZ0ZXJ3YXJkLCBvdGhlcndpc2UgcmVnaXN0ZXIgYWNjZXNzIHRvIHRo
ZSBMVERDIElQIGR1cmluZyB0aGUgZmJkZXYKZW11bGF0aW9uIHJlZ2lzdHJhdGlvbiBtaWdodCBo
YW5nIHRoZSBzeXN0ZW0uCgpUaGUgcHJvYmxlbSBoYXBwZW5zIGJlY2F1c2UgUlBNIGlzIGFjdGl2
YXRlZCBhdCB0aGUgZW5kIG9mIGx0ZGNfbG9hZCgpLApidXQgdGhlIGZiZGV2IGVtdWxhdGlvbiBy
ZWdpc3RyYXRpb24gaGFwcGVucyBvbmx5IGFmdGVyIHRoYXQsIGFuZCBlbmRzCnVwIGNhbGxpbmcg
bHRkY19jcnRjX21vZGVfc2V0X25vZmIoKSwgd2hpY2ggY2hlY2tzIHdoZXRoZXIgUlBNIGlzIGFj
dGl2ZQphbmQgb25seSBpZiBpdCBpcyBub3QgYWN0aXZlLCBjYWxscyBwbV9ydW50aW1lX2dldF9z
eW5jKCkgdG8gZW5hYmxlIHRoZQpjbG9jayBhbmQgc28gb24uIElmIHRoZSBjbG9jayBhcmUgbm90
IGVuYWJsZWQsIGFueSByZWdpc3RlciBhY2Nlc3MgaW4KbHRkY19jcnRjX21vZGVfc2V0X25vZmIo
KSBjb3VsZCBoYW5nIHRoZSBwbGF0Zm9ybSBjb21wbGV0ZWx5LgoKVGhpcyBwYXRjaCBtYWtlcyBz
dXJlIHRoYXQgbHRkY19jcnRjX21vZGVfc2V0X25vZmIoKSBpcyBjYWxsZWQgd2l0aGluCnBtX3J1
bnRpbWVfZ2V0X3N5bmMoKSwgc28gd2l0aCBjbG9jayBlbmFibGVkLgoKU2lnbmVkLW9mZi1ieTog
TWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+CkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5k
cmUudG9yZ3VlQHN0LmNvbT4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFy
ZEBzdC5jb20+CkNjOiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgpDYzog
WWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vc3RtL2Rydi5jCmluZGV4IDQxMTEwM2YwMTNlMi4uZDg5MjFlZGM4M2RiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0v
ZHJ2LmMKQEAgLTE5Nyw3ICsxOTcsOSBAQCBzdGF0aWMgaW50IHN0bV9kcm1fcGxhdGZvcm1fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQogCQlnb3RvIGVycl9w
dXQ7CiAKKwlwbV9ydW50aW1lX2dldF9zeW5jKGRkZXYtPmRldik7CiAJZHJtX2ZiZGV2X2dlbmVy
aWNfc2V0dXAoZGRldiwgMTYpOworCXBtX3J1bnRpbWVfcHV0X3N5bmMoZGRldi0+ZGV2KTsKIAog
CXJldHVybiAwOwogCi0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
