Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF26105EC
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 00:50:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80E2FC04003;
	Thu, 27 Oct 2022 22:50:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1297CC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 22:50:40 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0195D847F4;
 Fri, 28 Oct 2022 00:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666911039;
 bh=L2RUJA6avzpluMIYNWCe6g6q67lWcj7BpG+HavvWTlE=;
 h=From:To:Cc:Subject:Date:From;
 b=eabp1C37oKKwYakkhkqaoQhqqPySvEp4qVqT0A8jp9K2UNhUOuJwFYX84xFZHZTmf
 /yGKHhfk9GtytDDAMzcR/VI1juuh0APRaO9JnGU9yK0vp/ODCP0pzHvpltW7phDLC6
 AfC9ktC8OTlqGoBhTH5zMoEhAq9jMe6HoO+M1SZ1HqNC6SLLL6S3LfRm9+er2EtNxO
 a1wu7jPvFDXkSTFUyuANPsWzAm2A/SSOcf3eWhKXxpOoCRyNWBluhQkz3JzalE9vMU
 BV1SVb29z6nNRxVvw5U5lcHJSk6dZDhkywjtVIu75yX9YLYtBKesL/AqTOb3nRqKlf
 nrZ0YMGqLN8BQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 28 Oct 2022 00:50:18 +0200
Message-Id: <20221027225020.215149-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] [RFC] dt-bindings: nvmem: syscon: Add
	syscon backed nvmem bindings
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

QWRkIHRyaXZpYWwgYmluZGluZ3MgZm9yIGRyaXZlciB3aGljaCBwZXJtaXRzIGV4cG9zaW5nIHN5
c2NvbiBiYWNrZWQKcmVnaXN0ZXIgdG8gdXNlcnNwYWNlLiBUaGlzIGlzIHVzZWZ1bCBlLmcuIHRv
IGV4cG9zZSBVLUJvb3QgYm9vdApjb3VudGVyIG9uIHZhcmlvdXMgcGxhdGZvcm1zIHdoZXJlIHRo
ZSBib290IGNvdW50ZXIgaXMgc3RvcmVkIGluCnJhbmRvbSB2b2xhdGlsZSByZWdpc3RlciwgbGlr
ZSBTVE0zMk1QMTV4eCBUQU1QX0JLUHhSIHJlZ2lzdGVyLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsg
VmFzdXQgPG1hcmV4QGRlbnguZGU+Ci0tLQpDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJl
LnRvcmd1ZUBmb3NzLnN0LmNvbT4KQ2M6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5w
bD4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+CkNjOiBTcmluaXZhcyBLYW5k
YWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+CkNjOiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZwpDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpUbzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCi0tLQogLi4uL2JpbmRp
bmdzL252bWVtL252bWVtLXN5c2Nvbi55YW1sICAgICAgICAgIHwgMzkgKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0tc3lzY29uLnlh
bWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0v
bnZtZW0tc3lzY29uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZt
ZW0vbnZtZW0tc3lzY29uLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwMC4uMzAzNWEwYjJjZDI0YQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS1zeXNjb24ueWFtbApAQCAtMCwwICsxLDM5IEBA
CisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVz
ZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL252
bWVtL252bWVtLXN5c2Nvbi55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBHZW5lcmljIHN5c2NvbiBiYWNrZWQgbnZt
ZW0KKworbWFpbnRhaW5lcnM6CisgIC0gTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+CisKK2Fs
bE9mOgorICAtICRyZWY6ICJudm1lbS55YW1sIyIKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJs
ZToKKyAgICBlbnVtOgorICAgICAgLSBudm1lbS1zeXNjb24KKworICByZWc6CisgICAgbWF4SXRl
bXM6IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworCithZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgIHRhbXBANWMwMGEwMDAg
eworICAgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMyLXRhbXAiLCAic3lzY29uIiwgInNpbXBs
ZS1tZmQiOworICAgICAgICByZWcgPSA8MHg1YzAwYTAwMCAweDQwMD47CisKKyAgICAgICAgbnZt
ZW0tc3lzY29uIHsKKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibnZtZW0tc3lzY29uIjsKKyAg
ICAgICAgICAgIHJlZyA9IDwweDE0YyAweDQ+OworICAgICAgICB9OworICAgIH07Ci0tIAoyLjM1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
