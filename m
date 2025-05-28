Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1DAC6092
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 06:15:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1025CC36B29;
	Wed, 28 May 2025 04:15:42 +0000 (UTC)
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net
 [129.150.39.64])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0405C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 04:15:40 +0000 (UTC)
Received: from E0005182DT.eswin.cn (unknown [10.12.97.162])
 by app1 (Coremail) with SMTP id TAJkCgD3DQ_DjTZoOQuVAA--.6922S2;
 Wed, 28 May 2025 12:15:04 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
 jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
 0x1207@gmail.com, boon.khai.ng@altera.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 28 May 2025 12:14:42 +0800
Message-ID: <20250528041455.878-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgD3DQ_DjTZoOQuVAA--.6922S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4UZFy3KFy5ZFykGF4DArb_yoW8tr1kpa
 yDGFy5trn5Jr1xXws3Aa18KF95Xa97Kr43KFyfJwn3Xan8A34ktwn8KFyY9F97Cr48X3Wa
 qF1Yk343CFyqy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRifHU3UUUUU==
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 Shangjuan Wei <weishangjuan@eswincomputing.com>, linmin@eswincomputing.com
Subject: [Linux-stm32] [PATCH v2 0/2] Add driver support for Eswin eic7700
	SoC ethernet controller
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

RnJvbTogU2hhbmdqdWFuIFdlaSA8d2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbT4KClVw
ZGF0ZXM6CgogIGR0LWJpbmRpbmdzOiBldGhlcm5ldDogZXN3aW46IERvY3VtZW50IGZvciBFSUM3
NzAwIFNvQwogIHYxIC0+IHYyOgogICAgMS4gUmVtb3ZlIHRoZSBjb2RlIHJlbGF0ZWQgdG8gUEhZ
IExFRCBjb25maWd1cmF0aW9uIGZyb20gdGhlIE1BQyBkcml2ZXIuCiAgICAyLiBVc2UgcGh5bGli
IGluc3RlYWQgb2YgdGhlIEdQSU8gQVBJIGluIHRoZSBkcml2ZXIgdG8gaW1wbGVtZW50IHRoZSBQ
SFkgcmVzZXQgZnVuY3Rpb24uCiAgICAzLiBBbGlnbiB3aXRoIHRoZSBsYXRlc3Qgc3RtbWFjIEFQ
SSwgdXNlIHRoZSBBUEkgcHJvdmlkZWQgYnkgc3RtbWFjIGhlbHBlciB0byByZWZhY3RvciB0aGUg
ZHJpdmVyLAogICAgICAgYW5kIHJlcGxhY2Ugb3IgcmVtb3ZlIGR1cGxpY2F0ZSBjb2RlLgogICAg
NC4gQWRqdXN0IHRoZSBjb2RlIGZvcm1hdCBhbmQgZHJpdmVyIGludGVyZmFjZXMsIHN1Y2ggYXMg
cmVwbGFjaW5nIGt6YWxsb2Mgd2l0aCBkZXZtX2t6YWxsb2MsIGV0Yy4KCiAgZXRoZXJuZXQ6wqBl
c3dpbjrCoEFkZMKgZWljNzcwMMKgZXRoZXJuZXTCoGRyaXZlcgogIHYxIC0+IHYyOgogICAgMS4g
U2lnbmlmaWNhbnQgZXJyb3JzIGhhdmUgYmVlbiBjb3JyZWN0ZWQgaW4gdGhlIGVtYWlsIHJlcGx5
IGZvciB2ZXJzaW9uIHYxLgogICAgMi4gQWRkIHNucHMsZHdtYWMuCiAgICAzLiBDaGFuZyB0aGUg
bmFtZXMgb2YgcmVzZXQtbmFtZXMgYW5kIHBoeS1tb2RlLgogICAgNC4gQWRkIGRlc2NyaXB0aW9u
cyBvZiBlc3dpbiwgaHNwX3NwX2NzciwgZXN3aW4sIHN5c2NyZy5jc3IsIGVzd2luLCBkbHlfaHNw
LnJlZy4KCiAgUmVnYXJkaW5nIHRoZSBxdWVzdGlvbiBhYm91dCBkZWxheSBwYXJhbWV0ZXJzIGlu
IHRoZSBwcmV2aW91cyBlbWFpbCByZXBseSwgdGhlIGV4cGxhbmF0aW9uIGlzIGFzIGZvbGxvd3M6
CiAgICBEbHlfaHNwX3JlZzogQ29uZmlndXJlIHRoZSBkZWxheSBjb21wZW5zYXRpb24gcmVnaXN0
ZXIgYmV0d2VlbiBNQUMvUEhZOwogICAgRGx5X3BhcmFtXyAqOiBUaGUgdmFsdWUgd3JpdHRlbiB0
byB0aGUgZGx5X2hzcF9yZWcgcmVnaXN0ZXIgYXQgYSByYXRlIG9mIDEwMDAvMTAwLzEwLCB3aGlj
aCB2YXJpZXMgZHVlIAogICAgICAgICAgICAgICAgICB0byB0aGUgcm91dGluZyBvZiB0aGUgYm9h
cmQ7CgogIEluIGFkZGl0aW9uLCB5b3VyIGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBk
dF9iaW5kaW5nX2NoZWNrJyBvbiBvdXIgcGF0Y2ggYWJvdXQgeWFtbGxpbnQgd2FybmluZ3MvZXJy
b3JzLAogIGl0IGxvb2tzIGxpa2UgdGhlIHZhbGlkYXRpb24gZmFpbHVyZSBpcyBiZWNhdXNlIG1p
c3NpbmcgZXN3aW4gZW50cnkgaW4gdmVuZG9yLXByZWZpeGVzLnlhbWwuIAogIFdoZW4gd2UgcnVu
ICJtYWtlIGR0X2JpbmRpbmdfY2hlY2siLCB3ZSBnZXQgdGhlIHNhbWUgZXJyb3IuIFdlIGhhdmUg
YWxyZWFkeSBhZGRlZCAnZXN3aW4nIGluIHRoZSB2ZW5kb3ItcHJlZml4ZXMueWFtbCAKICBmaWxl
IGJlZm9yZSwgYW5kIHRoZSBjb2RlIGhhcyBtZW50aW9uZWQgdGhlIGNvbW11bml0eSwgYnV0IHlv
dSBoYXZlIG5vdCB5ZXQgaW50ZWdyYXRlZCBpdC4KClNoYW5nanVhbiBXZWkgKDIpOgogIGR0LWJp
bmRpbmdzOiBldGhlcm5ldDogZXN3aW46IERvY3VtZW50IGZvciBFSUM3NzAwIFNvQwogIGV0aGVy
bmV0OsKgZXN3aW46wqBBZGTCoGVpYzc3MDDCoGV0aGVybmV0wqBkcml2ZXIKCiAuLi4vYmluZGlu
Z3MvbmV0L2Vzd2luLGVpYzc3MDAtZXRoLnlhbWwgICAgICAgfCAyMDAgKysrKysrKysrCiBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnICAgfCAgMTEgKwogZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGUgIHwgICAxICsKIC4uLi9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1laWM3NzAwLmMgICB8IDQxMCArKysrKysrKysrKysr
KysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNjIyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2Vzd2luLGVpYzc3MDAt
ZXRoLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1laWM3NzAwLmMKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
