Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF7642A03
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 15:01:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26CA7C65E69;
	Mon,  5 Dec 2022 14:01:14 +0000 (UTC)
Received: from predatorhelios.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr [90.63.244.31])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A98DC65E5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 13:43:56 +0000 (UTC)
Received: by predatorhelios.localdomain (Postfix, from userid 1001)
 id EC7D03E0211; Mon,  5 Dec 2022 14:43:54 +0100 (CET)
From: Fabien Parent <fparent@baylibre.com>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com, linux-gpio@vger.kernel.org
Date: Mon,  5 Dec 2022 14:43:51 +0100
Message-Id: <20221205134354.1772429-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Dec 2022 14:01:12 +0000
Subject: [Linux-stm32] [PATCH v4 0/3] Remove the pins-are-numbered DT
	property
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

RnJvbTogQmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+CgpEdXJpbmcg
dGhlIHJldmlldyBvZiBteSBNVDgzNjUgc3VwcG9ydCBwYXRjaHNldAooaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMjExMTcyMTAzNTYuMzE3ODU3OC0xLWJlcm9AYmF5
bGlicmUuY29tLyksCnRoZSBpc3N1ZSBvZiB0aGUgInBpbnMtYXJlLW51bWJlcmVkIiBEZXZpY2VU
cmVlIHByb3BlcnR5IGhhcyBjb21lIHVwLgoKVGhpcyBwcm9wZXJ0eSBpcyB1bmlxdWUgdG8gTWVk
aWF0ZWsgTVQ2NXh4IGFuZCBTVE0zMiBwaW5jdHJscywgYW5kCmRvZXNuJ3Qgc2VlbSB0byBzZXJ2
ZSBhbnkgcHVycG9zZSAoYm90aCB0aGUgTWVkaWF0ZWsgYW5kIFNUTTMyIGRyaXZlcnMKc2ltcGx5
IHJlZnVzZSB0byBkZWFsIHdpdGggYSBkZXZpY2UgdW5sZXNzIHBpbnMtYXJlLW51bWJlcmVkIGlz
IHNldCB0bwp0cnVlKS4KClRoZXJlIGlzIG5vIG90aGVyIHVzZSBvZiB0aGlzIHByb3BlcnR5IGlu
IHRoZSBrZXJuZWwgb3IgaW4gb3RoZXIgcHJvamVjdHMKdXNpbmcgRGV2aWNlVHJlZXMgKGNoZWNr
ZWQgdS1ib290IGFuZCBGcmVlQlNEIC0tIGluIGJvdGggb2YgdGhvc2UsIHRoZQpmbGFnIGlzIHBy
ZXNlbnQgaW4gTWVkaWF0ZWsgYW5kIFNUTSBkZXZpY2V0cmVlcywgYnV0IG5vdCB1c2VkIGFueXdo
ZXJlKS4KClRoZXJlIGlzIGFsc28gbm8ga25vd24gdXNlIGluIHVzZXJzcGFjZSAoaW4gZmFjdCwg
YSB1c2VybGFuZCBhcHBsaWNhdGlvbgpyZWx5aW5nIG9uIHRoZSBwcm9wZXJ0eSB3b3VsZCBiZSBi
cm9rZW4gYmVjYXVzZSBpdCB3b3VsZCBnZXQgdHJ1ZSBvbgphbnkgTWVkaWF0ZWsgb3IgU1RNIGNo
aXBzZXQgYW5kIGZhbHNlIG9uIGFsbCBvdGhlcnMsIGV2ZW4gdGhvdWdoIG90aGVyCmNoaXBzZXRz
IHVzZSBudW1iZXJlZCBwaW5zKS4KClRoaXMgcGF0Y2hzZXQgcmVtb3ZlcyBhbGwgdXNlcyBvZiBw
aW5zLWFyZS1udW1iZXJlZCBhbmQgbWFya3MgdGhlCnByb3BlcnR5IGFzIGRlcHJlY2F0ZWQuCgp2
NDoKICAtIFRoZSBnZW5lcmljIHBpbmN0cmwgcmVsYXRlZCBwYXRjaGVzIGFyZSBub3cgaW4gdGhl
IHBpbmN0cmwgdHJlZQogICAgZm9yIHY2LjIgLSByZW1vdmUgdGhlbSBhbmQgcmVwb3N0IHRoZSBy
ZW1haW5pbmcgYml0cyBvZiB0aGUgcGF0Y2gKICAgIHNldC4gTm8gb3RoZXIgY2hhbmdlcy4KCnYz
OgogIC0gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzOyBhZGQgcmVjZW50IFJldmlld2VkLUJ5cyBhbmQg
QWNrZWQtQnlzLAogICAgYWRkIGxpbnV4LWdwaW8gdG8gQ2MKCnYyOgogIC0gRGVwcmVjYXRlIHRo
ZSBwcm9wZXJ0eSBpbnN0ZWFkIG9mIHJlbW92aW5nIGl0IGNvbXBsZXRlbHkgZnJvbQogICAgc2No
ZW1hcwogIC0gc3F1YXNoIHNvbWUgcmVsYXRlZCBjb21taXRzCgpCZXJuaGFyZCBSb3Nlbmtyw6Ru
emVyICgzKToKICBhcm02NDogZHRzOiBtZWRpYXRlazogUmVtb3ZlIHBpbnMtYXJlLW51bWJlcmVk
IHByb3BlcnR5CiAgQVJNOiBkdHM6IG1lZGlhdGVrOiBSZW1vdmUgcGlucy1hcmUtbnVtYmVyZWQg
cHJvcGVydHkKICBBUk06IGR0czogc3RtMzI6IFJlbW92ZSB0aGUgcGlucy1hcmUtbnVtYmVyZWQg
cHJvcGVydHkKCiBhcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSAgICAgICAgICAgICAgICB8
IDEgLQogYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzLmR0c2kgICAgICAgICAgICAgICAgfCAxIC0K
IGFyY2gvYXJtL2Jvb3QvZHRzL210ODEzNS5kdHNpICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNo
L2FybS9ib290L2R0cy9zdG0zMmY0LXBpbmN0cmwuZHRzaSAgICAgICB8IDEgLQogYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJmNy1waW5jdHJsLmR0c2kgICAgICAgfCAxIC0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMyaDc0My5kdHNpICAgICAgICAgICAgIHwgMSAtCiBhcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTMxLmR0c2kgICAgICAgICAgICB8IDEgLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDE1MS5kdHNpICAgICAgICAgICAgfCAyIC0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210MjcxMmUuZHRzaSAgICB8IDEgLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
NjcuZHRzaSAgICAgfCAxIC0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLWVs
bS5kdHNpIHwgMSAtCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpICAg
ICB8IDEgLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDg1MTYuZHRzaSAgICAgfCAx
IC0KIDEzIGZpbGVzIGNoYW5nZWQsIDE0IGRlbGV0aW9ucygtKQoKLS0gCjIuMzguMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
