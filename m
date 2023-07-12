Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83B750801
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 14:19:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34787C6B44D;
	Wed, 12 Jul 2023 12:19:26 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A119C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 12:19:25 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.goehrs@pengutronix.de>)
 id 1qJYoJ-0001cW-3E; Wed, 12 Jul 2023 14:19:11 +0200
Message-ID: <44633ed0-9401-6d03-000a-4fce5e16ae5c@pengutronix.de>
Date: Wed, 12 Jul 2023 14:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US-large
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Sean Nyekjaer <sean@geanix.com>
References: <20230712062954.2194505-1-sean@geanix.com>
 <20230712062954.2194505-7-sean@geanix.com>
 <92f7f4cd-c9cc-8a1a-74c7-39eed955cd6a@pengutronix.de>
 <92C36A18-F359-497E-8267-03E5C62811F6@geanix.com>
 <d57fdae4-9931-6e37-56e1-9649074b3142@pengutronix.de>
From: =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>
In-Reply-To: <d57fdae4-9931-6e37-56e1-9649074b3142@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.goehrs@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, dantuguf14105@gmail.com,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 7/8] dt-bindings: arm: stm32: add extra
 SiP compatible for oct, stm32mp157c-osd32-red
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIDEyLjA3LjIzIDExOjE4LCBBaG1hZCBGYXRvdW0gd3JvdGU6Cj4gT24gMTIuMDcuMjMgMTE6
MTEsIFNlYW4gTnlla2phZXIgd3JvdGU6Cj4+PiBPbiAxMiBKdWwgMjAyMywgYXQgMTAuMzgsIEFo
bWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Pj4gT24gMTIuMDcu
MjMgMDg6MjksIFNlYW4gTnlla2phZXIgd3JvdGU6Cj4+Pj4gQWRkIGJpbmRpbmcgc3VwcG9ydCBm
b3IgdGhlIE9jdGF2byBPU0QzMk1QMS1SRUQgZGV2ZWxvcG1lbnQgYm9hcmQuCj4+Pj4KPj4+PiBH
ZW5lcmFsIGZlYXR1cmVzOgo+Pj4+IC0gU1RNMzJNUDE1N0MKPj4+PiAtIDUxMk1CIEREUjMKPj4+
PiAtIENBTi1GRAo+Pj4+IC0gSERNSQo+Pj4+IC0gVVNCLUMgT1RHCj4+Pj4gLSBVQVJUCj4+Pj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+Cj4+Pj4g
QWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+Pgo+
Pj4gSnVzdCBhIGhlYWRzIHVwOiBUaGUgTFhBIFRBQywgYW5vdGhlciBPU0QzMk1QMSBib2FyZCBo
YXMgYmVlbiBtZXJnZWQgaW50bwo+Pj4gc3RtMzItbmV4dCB5ZXN0ZXJkYXksIHNvIGFwcGx5aW5n
IHlvdXIgc2VyaWVzIG9udG8gdGhhdCB0cmVlIG1heSByZXN1bHQKPj4+IGluIGNvbmZsaWN0cy4g
WW91IG1heSB3YW50IHRvIHJlYmFzZSBmb3IgdjQuCj4+Pgo+Pj4gQ2hlZXJzLAo+Pj4gQWhtYWQK
Pj4KPj4gVGhhbmtzLCB3aWxsIGRvIDopCj4+Cj4+IENhbiBJIGdldCB5b3UgdG8gbG9vayBhdCA0
LzgsIDUvOCBhbmQgNi84IGluIHRoaXMgc2VyaWVzPyBXaWxsIHRoZXkgYnJlYWsgYW55dGhpbmcg
Zm9yIExYQSBUQUM/Cj4gCj4gTGVvbmFyZCwgZG9lcyB0aGUgTFhBIFRBQyBoYXZlIGFuIGltcGxp
Y2l0IGRlcGVuZGVuY3kgb24gYW55IG9mIHRoZSByYWlscyB0aGF0IFNlYW4gaXMKPiBub3cgdHVy
bmluZyBvZmYgYnkgZGVmYXVsdD8KCk5vLCByZW1vdmluZyB0aGUgcmVndWxhdG9yLWFsd2F5cy1v
biBmb3IgdGhlc2UgdGhyZWUgcmVndWxhdG9ycyBvbiB0aGUgTFhBIFRBQyBzaG91bGQgYmUgZmlu
ZS4KV2UgZG8gbm90IHVzZSB2MXYyX2hkbWkgYW5kIHYxdjhfYXVkaW8gYXQgYWxsIGFuZCBhbHJl
YWR5IGhhdmUKIi9kZWxldGUtcHJvcGVydHkvcmVndWxhdG9yLWFsd2F5cy1vbiIgaW4gb3VyIHN0
bTMybXAxNXhjLWx4YS10YWMuZHRzaSBmb3IgdjN2M19oZG1pLAp3aGljaCBiZWNvbWVzIG9ic29s
ZXRlIHdpdGggdGhpcyBwYXRjaC4KSSB3b3VsZCBhcHByZWNpYXRlIGl0IGlmIHlvdSBhZGRlZCBw
YXRjaCB0byByZW1vdmUgaXQgZnJvbSBzdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kgaWYgeW91CnNl
bmQgYSB2NC4KCllvdSBjYW4gYWRkIG15IEFja2VkLWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5nb2Vo
cnNAcGVuZ3V0cm9uaXguZGU+IHRvIHRoZXNlIHRocmVlIHBhdGNoZXMsCmlmIHlvdSBsaWtlLgoK
R3JlZXRpbmdzCkxlb25hcmQKCj4gQ2hlZXJzLAo+IEFobWFkCj4gCj4+Cj4+IC9TZWFuCj4+Cj4+
Pgo+Pj4KPj4+PiAtLS0KPj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3N0bTMyL3N0bTMyLnlhbWwgfCAzICsrLQo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwKPj4+PiBpbmRleCAxM2Uz
NDI0MTE0NWIuLjU1ZTQ1ZGIxYWYyNiAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwKPj4+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwKPj4+PiBAQCAt
MTQzLDcgKzE0Myw4IEBAIHByb3BlcnRpZXM6Cj4+Pj4gICAgICAgIC0gZGVzY3JpcHRpb246IE9j
dGF2byBPU0QzMk1QMTV4IFN5c3RlbS1pbi1QYWNrYWdlIGJhc2VkIGJvYXJkcwo+Pj4+ICAgICAg
ICAgIGl0ZW1zOgo+Pj4+ICAgICAgICAgICAgLSBlbnVtOgo+Pj4+IC0gICAgICAgICAgICAgIC0g
bHhhLHN0bTMybXAxNTdjLW1jMSAjIExpbnV4IEF1dG9tYXRpb24gTUMtMQo+Pj4+ICsgICAgICAg
ICAgICAgIC0gbHhhLHN0bTMybXAxNTdjLW1jMSAgICAgICAjIExpbnV4IEF1dG9tYXRpb24gTUMt
MQo+Pj4+ICsgICAgICAgICAgICAgIC0gb2N0LHN0bTMybXAxNTdjLW9zZDMyLXJlZCAjIE9jdGF2
byBPU0QzMk1QMSBSRUQgYm9hcmQKPj4+PiAgICAgICAgICAgIC0gY29uc3Q6IG9jdCxzdG0zMm1w
MTV4eC1vc2QzMgo+Pj4+ICAgICAgICAgICAgLSBlbnVtOgo+Pj4+ICAgICAgICAgICAgICAgIC0g
c3Qsc3RtMzJtcDE1Nwo+Pj4KPj4+IC0tIAo+Pj4gUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPj4+IFN0ZXVl
cndhbGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0
cm9uaXguZGUvICB8Cj4+PiAzMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICAgICAgICAgICAgICAg
ICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTAgICAgfAo+Pj4gQW10c2dlcmljaHQgSGlsZGVz
aGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkxNy01NTU1IHwK
Pj4KPj4KPj4KPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
