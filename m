Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E78936105EE
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 00:50:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3468C64104;
	Thu, 27 Oct 2022 22:50:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B018C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 22:50:40 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D51668504E;
 Fri, 28 Oct 2022 00:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666911040;
 bh=N62Hk+Gw4oQcI//HElUbloWjF9R9+UkngmVF9hoEa2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uImhcOTuCWiWIlNj721jXHtopftKa7v/WhqVU+4bD0zsLWFr+gRZ+gWLPHqAt40BT
 jnuIUe0Yx+ETUco7gY9xuL+dINt0wnLx6rmnCkjEEcugA5rMzsPCmN6/XdA+XlPxM3
 wm+3uhcJ9oeOwaZyxYWZVCEt4sjatxFCvbZNUtIaycUB3TwqYau1SK5MS2jYVr3Ed/
 NxEwy5KJPm8lCifnAmD13fSBv9n4k/fo5HvmYcVPwCz+/iNeMiKGPLvvxtnWGIE1QU
 t2mQ8vp4SIyHpP3baKOwosxw6IWgrFWBOhg31PJsQziQk+x7HwZVDiYmh0aAmszYyV
 fgmqDVElDNBoQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 28 Oct 2022 00:50:20 +0200
Message-Id: <20221027225020.215149-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221027225020.215149-1-marex@denx.de>
References: <20221027225020.215149-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/3] [RFC] ARM: dts: stm32: Add nvmem-syscon
	node to TAMP to expose boot count on DHSOM
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

QWRkIG52bWVtLXN5c2NvbiBzdWJub2RlIHRvIGV4cG9zZSBUQU1QX0JLUHhSIHJlZ2lzdGVyIDE5
IHRvIHVzZXIgc3BhY2UuClRoaXMgcmVnaXN0ZXIgY29udGFpbnMgVS1Cb290IGJvb3QgY291bnRl
ciwgYnkgZXhwb3NpbmcgaXQgdG8gdXNlciBzcGFjZQp0aGUgdXNlciBzcGFjZSBjYW4gcmVzZXQg
dGhlIGJvb3QgY291bnRlci4KClJlYWQgYWNjZXNzIGV4YW1wbGU6CiIKJCBoZXhkdW1wIC12QyAv
c3lzL2J1cy9udm1lbS9kZXZpY2VzLzVjMDBhMDAwLnRhbXBcOm52bWVtMC9udm1lbQowMDAwMDAw
MCAgMGMgMDAgYzQgYjAKIgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbngu
ZGU+Ci0tLQpDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNv
bT4KQ2M6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KQ2M6IFJvYiBIZXJyaW5n
IDxyb2JoK2R0QGtlcm5lbC5vcmc+CkNjOiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5r
YW5kYWdhdGxhQGxpbmFyby5vcmc+CkNjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpDYzog
bGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpUbzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCi0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
eHgtZGhjb20tc29tLmR0c2kgfCAxMSArKysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1eHgtZGhjb3Itc29tLmR0c2kgfCAxMSArKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDE1eHgtZGhjb20tc29tLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNv
bS1zb20uZHRzaQppbmRleCAxNTU4NDNlMTQwMmZiLi44Mjc3ODM3YmU4YTUxIDEwMDY0NAotLS0g
YS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaQorKysgYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaQpAQCAtNTMzLDYgKzUzMywx
NyBAQCAmc2RtbWMzIHsKIAlzdGF0dXMgPSAib2theSI7CiB9OwogCismdGFtcCB7CisJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisJI3NpemUtY2VsbHMgPSA8MT47CisKKwkvKiBCb290IGNvdW50ZXIg
Ki8KKwludm1lbSB7CisJCWNvbXBhdGlibGUgPSAibnZtZW0tc3lzY29uIjsKKwkJcmVnID0gPDB4
MTRjIDB4ND47CisJfTsKK307CisKICZ1YXJ0NCB7CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKIAlwaW5jdHJsLTAgPSA8JnVhcnQ0X3BpbnNfYT47CmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1zb20uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMybXAxNXh4LWRoY29yLXNvbS5kdHNpCmluZGV4IDEzNGE3OThhZDNmMjMuLjQyYThkNWNkZDcw
MjQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLXNvbS5k
dHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLXNvbS5kdHNpCkBA
IC0yNzEsMyArMjcxLDE0IEBAICZybmcxIHsKICZydGMgewogCXN0YXR1cyA9ICJva2F5IjsKIH07
CisKKyZ0YW1wIHsKKwkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkjc2l6ZS1jZWxscyA9IDwxPjsK
KworCS8qIEJvb3QgY291bnRlciAqLworCW52bWVtIHsKKwkJY29tcGF0aWJsZSA9ICJudm1lbS1z
eXNjb24iOworCQlyZWcgPSA8MHgxNGMgMHg0PjsKKwl9OworfTsKLS0gCjIuMzUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
