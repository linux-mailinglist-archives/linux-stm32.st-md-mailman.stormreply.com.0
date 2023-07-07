Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67B74B7D8
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jul 2023 22:33:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 681B9C6B45C;
	Fri,  7 Jul 2023 20:33:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BF37C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 20:33:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E249D61A6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 20:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5530EC433CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 20:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688761999;
 bh=6QgMyrqXqeI6SEHa107HdWgEq35vmLXVAeALwcT+lDs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Gx9KJf9fL/mmok1L7S1JEw98F7rQhqcE0z1w8BHJD17srLItsZuymDl+Vh6LuOMqc
 4alUEBZ5opvgHkrhgxf7bnhwEXvTA+lJ+2wjTvLnBj5RIOrUBEqvzoLMwkvr5kKOo5
 yISOGrruanfS4vCw4yBo4KjJkpCqE5P53NTnagcHPGIOblr6h6cNsX8ys6OcsyQ0H4
 qrXgMrqCQhWJISUHikJ+H6A9Rt5IkKe3q5S7a3IgZXRpoKmUEEfF3davdWD0SEJOLF
 x6HLSMnKxFc6bNn9fzW5yjsdHLXCNjC5gVSA2oPohD58IIKPy37fpI2og6S7rvH4ES
 9S5gMKOibrioQ==
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2b6f52e1c5cso37190981fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Jul 2023 13:33:19 -0700 (PDT)
X-Gm-Message-State: ABy/qLYCKHinEbGXty6HTB7P9Rzt9oBn3e2oFj9sHdxMI9A6DbCNOM47
 apBDb/amI8JiOZHkmvyY8tr1pUJiI+U4qxapAg==
X-Google-Smtp-Source: APBJJlG4YuPBi7t5aJDihdeDntOW9LxmDKsR0D/L3YobFTVh86nYL2PgWf1QDLA9jOV+N7/XaSZs5aykFPftRmtwQjM=
X-Received: by 2002:a2e:8706:0:b0:2b2:104d:8f89 with SMTP id
 m6-20020a2e8706000000b002b2104d8f89mr5474388lji.0.1688761997303; Fri, 07 Jul
 2023 13:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <875y6vzuga.fsf@epam.com>
 <20230707152724.GA329615-robh@kernel.org> <87sf9zya79.fsf@epam.com>
In-Reply-To: <87sf9zya79.fsf@epam.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Jul 2023 14:33:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJkkT4SZcHj-RLPpDpX+t3Oe6RHyjeBNh4arWbMx-J0Og@mail.gmail.com>
Message-ID: <CAL_JsqJkkT4SZcHj-RLPpDpX+t3Oe6RHyjeBNh4arWbMx-J0Og@mail.gmail.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Peng Fan <peng.fan@nxp.com>
Cc: "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "hugues.fruchet@foss.st.com" <hugues.fruchet@foss.st.com>,
 "lee@kernel.org" <lee@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "arnd@kernel.org" <arnd@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 04/10] dt-bindings: treewide: add
 feature-domains description in binding files
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

T24gRnJpLCBKdWwgNywgMjAyMyBhdCAxMDoxMOKAr0FNIE9sZWtzaWkgTW9pc2llaWV2CjxPbGVr
c2lpX01vaXNpZWlldkBlcGFtLmNvbT4gd3JvdGU6Cj4KPgo+IEhpIFJvYiwKPgo+IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyaXRlczoKPgo+ID4gT24gRnJpLCBKdWwgMDcsIDIwMjMg
YXQgMDI6MDc6MThQTSArMDAwMCwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6Cj4gPj4KPiA+PiBH
YXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+IHdyaXRlczoK
PiA+Pgo+ID4+ID4gZmVhdHVyZS1kb21haW5zIGlzIGFuIG9wdGlvbmFsIHByb3BlcnR5IHRoYXQg
YWxsb3dzIGEgcGVyaXBoZXJhbCB0bwo+ID4+ID4gcmVmZXIgdG8gb25lIG9yIG1vcmUgZmVhdHVy
ZSBkb21haW4gY29udHJvbGxlcihzKS4KPiA+PiA+Cj4gPj4gPiBEZXNjcmlwdGlvbiBvZiB0aGlz
IHByb3BlcnR5IGlzIGFkZGVkIHRvIGFsbCBwZXJpcGhlcmFsIGJpbmRpbmcgZmlsZXMgb2YKPiA+
PiA+IHRoZSBwZXJpcGhlcmFsIHVuZGVyIHRoZSBTVE0zMiBmaXJld2FsbCBjb250cm9sbGVycy4g
SXQgYWxsb3dzIGFuIGFjY3VyYXRlCj4gPj4gPiByZXByZXNlbnRhdGlvbiBvZiB0aGUgaGFyZHdh
cmUsIHdoZXJlIHZhcmlvdXMgcGVyaXBoZXJhbHMgYXJlIGNvbm5lY3RlZAo+ID4+ID4gdG8gdGhp
cyBmaXJld2FsbCBidXMuIFRoZSBmaXJld2FsbCBjYW4gdGhlbiBjaGVjayB0aGUgcGVyaXBoZXJh
bCBhY2Nlc3Nlcwo+ID4+ID4gYmVmb3JlIGFsbG93aW5nIGl0IHRvIHByb2JlLgo+ID4+ID4KPiA+
PiA+IFNpZ25lZC1vZmYtYnk6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBm
b3NzLnN0LmNvbT4KPiA+PiA+IC0tLQo+ID4+ID4KPiA+PiA+IERpc2NsYWltZXI6IFNvbWUgZXJy
b3Igd2l0aCBkdGJzX2NoZWNrIHdpbGwgYmUgb2JzZXJ2ZWQgYXMgSSd2ZQo+ID4+ID4gY29uc2lk
ZXJlZCB0aGUgcHJvcGVydHkgdG8gYmUgZ2VuZXJpYywgYXMgUm9iIGFza2VkCj4gPj4gPgo+ID4+
ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8vc3Qsc3RtMzItaGFz
aC55YW1sICB8IDQgKysrKwo+ID4+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kbWEvc3Qsc3RtMzItZG1hLnlhbWwgICAgICB8IDQgKysrKwo+ID4+ID4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc3Qsc3RtMzItZG1hbXV4LnlhbWwgICB8IDQgKysr
Kwo+ID4+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvc3Qsc3RtMzIt
aTJjLnlhbWwgICAgICB8IDQgKysrKwo+ID4+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9paW8vYWRjL3N0LHN0bTMyLWFkYy55YW1sICB8IDQgKysrKwo+ID4+ID4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvc3Qsc3RtMzItZGZzZG0tYWRjLnlhbWwgICAgICB8
IDQgKysrKwo+ID4+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vZGFj
L3N0LHN0bTMyLWRhYy55YW1sICB8IDQgKysrKwo+ID4+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL2NlYy9zdCxzdG0zMi1jZWMueWFtbCAgICAgICAgICB8IDQgKysrKwo+ID4+ID4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlh
bWwgICB8IDQgKysrKwo+ID4+ID4gIC4uLi9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvc3Qs
c3RtMzItZm1jMi1lYmkueWFtbCAgICAgICB8IDQgKysrKwo+ID4+ID4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItbHB0aW1lci55YW1sICB8IDQgKysrKwo+
ID4+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItdGlt
ZXJzLnlhbWwgICB8IDUgKysrKysKPiA+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbW1jL2FybSxwbDE4eC55YW1sICAgICAgICAgfCA0ICsrKysKPiA+PiA+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0bTMyLWR3bWFjLnlhbWwgICAgICAgfCA0
ICsrKysKPiA+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3BoeS1z
dG0zMi11c2JwaHljLnlhbWwgfCA0ICsrKysKPiA+PiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9yZWd1bGF0b3Ivc3Qsc3RtMzItdnJlZmJ1Zi55YW1sICAgICAgfCA0ICsrKysKPiA+PiA+ICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcm5nL3N0LHN0bTMyLXJuZy55YW1sICAg
ICAgfCA0ICsrKysKPiA+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2Vy
aWFsL3N0LHN0bTMyLXVhcnQueWFtbCAgfCA0ICsrKysKPiA+PiA+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3Qsc3RtMzItaTJzLnlhbWwgICAgfCA0ICsrKysKPiA+
PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3Qsc3RtMzItc2Fp
LnlhbWwgICAgfCA0ICsrKysKPiA+PiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9z
dCxzdG0zMi1zcGRpZnJ4LnlhbWwgICAgICAgICAgfCA0ICsrKysKPiA+PiA+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMyLXFzcGkueWFtbCAgICAgfCA0ICsr
KysKPiA+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0bTMy
LXNwaS55YW1sICAgICAgfCA0ICsrKysKPiA+PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzIueWFtbCAgICAgICAgICAgICAgfCA0ICsrKysKPiA+PiA+ICAyNCBm
aWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspCj4gPj4gPgo+ID4+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcnlwdG8vc3Qsc3RtMzItaGFzaC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NyeXB0by9zdCxzdG0zMi1o
YXNoLnlhbWwKPiA+PiA+IGluZGV4IGI3NjdlYzcyYTk5OS4uZGFmOGRjYWVmNjI3IDEwMDY0NAo+
ID4+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NyeXB0by9zdCxz
dG0zMi1oYXNoLnlhbWwKPiA+PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9jcnlwdG8vc3Qsc3RtMzItaGFzaC55YW1sCj4gPj4gPiBAQCAtNTAsNiArNTAsMTAgQEAg
cHJvcGVydGllczoKPiA+PiA+ICAgIHBvd2VyLWRvbWFpbnM6Cj4gPj4gPiAgICAgIG1heEl0ZW1z
OiAxCj4gPj4gPgo+ID4+ID4gKyAgZmVhdHVyZS1kb21haW5zOgo+ID4+ID4gKyAgICBtaW5JdGVt
czogMQo+ID4+ID4gKyAgICBtYXhJdGVtczogMwo+ID4+ID4gKwo+ID4+Cj4gPj4gSSBiZWxpZXdl
IGZlYXR1cmUtZG9tYWlucyBpcyBnZW5lcmljIGJpbmRpbmcuIFRoaXMgbWVhbnMgdGhhdCBtYXhJ
dGVtcwo+ID4+IGNhbiBiZSBpbXBsZW1lbnRhdGlvbiBkZXBlbmRlbmQuIEkgd291bGQgcmF0aGVy
IGRyb3AgbWF4SXRlbXMgc28gdGhlCj4gPj4gZm9sbG93aW5nIGZvcm1hdCB3aWxsIGJlIHBvc3Np
YmxlOgo+ID4+Cj4gPj4gICAgICAgICAgIGZlYXR1cmUtZG9tYWlucyA9IDwmZXR6cGMgMT4sIDwm
ZXR6cGMgMj4sIDwmc29tZV9vdGhlcl9kb21haW4gMSAyIDMgND4KPiA+PiAgICAgICAgICAgZmVh
dHVyZS1kb21haW4tbmFtZXMgPSAiZmlyZXdhbGwgMSIsICJmaXJld2FsbCAyIiwgIm90aGVyX2Rv
bWFpbiIKPiA+Cj4gPiBUaGUgYWJvdmUgYWxyZWFkeSBhbGxvd3MgdGhpcyAobm90IC1uYW1lcywg
YnV0IHRoZSBudW1iZXIgb2YgZW50cmllcykuCj4gPj4KPiA+PiBBbHNvIEkgYmVsaWV3ZSBkcml2
ZXIgd2lsbCBoYW5kbGUgZmVhdHVyZS1kb21haW4tbmFtZXMgcHJvcGVydHkgc28gaXQKPiA+PiB3
aWxsIHBhcnNlIGZlYXR1cmUtZG9tYWlucyBvbmx5IHJlbGF0ZWQgdG8gdGhlIGZpcmV3YWxsLgo+
ID4KPiA+IE5vdyBJJ20gY3VyaW91cy4gV2hhdCdzIGFuIGV4YW1wbGUgdGhhdCdzIG5vdCBhIGZp
cmV3YWxsPwo+ID4KPiA+IChOb3RlIEknbSBzdGlsbCBub3QgaGFwcHkgd2l0aCB0aGUgbmFtaW5n
IG9mICdmZWF0dXJlJyBhcyBhbnl0aGluZyBpcyBhCj4gPiBmZWF0dXJlLCBidXQgdGhhdCdzIHRo
ZSBsZWFzdCBvZiB0aGUgaXNzdWVzIHJlYWxseS4pCj4gPgo+Cj4gVGhlIGFsdGVybmF0aXZlIHVz
YWdlcyBvZiBmZWF0dXJlLWRvbWFpbnMgd2FzIG9yaWdpbmFsbHkgcHJvcG9zZWQgYnkgbWUKPiBo
ZXJlOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYzg2OWQyNzUxMTI1MTgxYTU1YmM4
YTg4Yzk2ZTNhODkyYjQyZjM3YS4xNjY4MDcwMjE2LmdpdC5vbGVrc2lpX21vaXNpZWlldkBlcGFt
LmNvbS8KPgo+IEFsc28gSSByZW1lbWJlciBQZW5nIEZhbiBhbHNvIHdhcyBpbnRlcmVzdGVkIGlu
IHRob3NlIGJpbmRpbmdzLgoKSXQgaGVscHMgdG8gQ2MgcGVvcGxlIHdoZW4geW91IHRhbGsgYWJv
dXQgdGhlbS4KCklmIHRoZSBwYXJ0aWVzIGludGVyZXN0ZWQgaW4gdGhpcyB3YW50IHRvIHNlZSBw
cm9ncmVzcyBvbiB0aGlzLCB5b3UKYWxsIG11c3Qgd29yayB0b2dldGhlciBhbmQgc2hvdyB0aGlz
IGlzIGEgc29sdXRpb24gZm9yIG11bHRpcGxlCnBsYXRmb3Jtcy4KCj4gSSB0aGluayB0aGUgdXNl
LWNhc2Ugd2hlbiBvbmUgbm9kZSBpcyBwcm90ZWN0ZWQgYnkgZmlyZXdhbGwgYW5kIGFsc28gaXMK
PiBjb250cm9sbGVkIGJ5IHNjbWkgZmVhdHVyZS1kb21haW4tY29udHJvbGxlciAoQXMgd2FzIHBy
b3Bvc2VkIGluIG15Cj4gcGF0Y2ggc2VyaWVzKSBtYXkgdGFrZSBwbGFjZS4KCkJ1dCBpc24ndCB0
aGUgU0NNSSBkZXZpY2UgcHJvdGVjdGlvbiBpbnRlcmZhY2UgdGhlIHNhbWUgdGhpbmc/IFNvbWUK
aW50ZXJmYWNlIHRvIHNheSAiY2FuIEkgYWNjZXNzIHRoaXMgZGV2aWNlPyIgYW5kL29yIGNvbnRy
b2wgYWNjZXNzIHRvCml0LgoKVGhlIG90aGVyIHBvc3NpYmxlIHVzZSBJJ20gYXdhcmUgb2YgaXMg
c3lzdGVtIHBhcnRpdGlvbmluZy4gT3BlbkFNUCBvcgpzaW1pbGFyIHdoZXJlIGFuIFNvQyBpcyBw
YXJ0aXRpb25lZCBpbnRvIG11bHRpcGxlIE9TIGluc3RhbmNlcyBhbmQKcGVyaXBoZXJhbHMgYXJl
IGFzc2lnbmVkIHRvIGRpZmZlcmVudCBwYXJ0aXRpb25zLgoKPiBBcyBmb3IgdGhlIG5hbWluZyBt
YXliZSB5b3UgaGF2ZSBzb21lIHRob3VnaHRzIGFib3V0IGJldHRlciBuYW1lPwoKSWYgSSBkaWQs
IEkgd291bGQgaGF2ZS4gU29tZXRoaW5nIHdpdGggJ2FjY2VzcycgaW4gaXQgaXMgYXMgZmFyIGFz
IEkndmUgZ290dGVuLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
