Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C69958526
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 12:50:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8E73C6DD66;
	Tue, 20 Aug 2024 10:50:30 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86E09CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 10:50:23 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id gMRNs7LZjwSfLgMRNsuK6W; Tue, 20 Aug 2024 12:50:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1724151023;
 bh=X3DOniTI7c55GuiMpK8pOTIVjxNvcVnLEOswNdsJKGk=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=ruGjHovjwVAFHkPZLxFnKlkVPSR2sH1Tu8Yzl2KCNT+h0UXE/4BbQPCozyF2XbFZ/
 nwpCjlw+zrln9JtbDFUk46hZna6dmbneDRXpOg01Mqh2+FB/bqt95uevMJ3jixrJ8Z
 TmWJa0R+gQavq69twWk3XNGOruh6Eq2n3ZCW6/MGUfq2zHrWZCSjaIQwUIlowhHpzZ
 Fnt8K3hVLPlc6xZYMbYmpijRyRIRLbtYz5iQZ/UWazGyJUHpfitv6UATNyixmJUbQG
 vMGb1d4pU/44nDXBHLabcwHkENzJjyG4ymuJRiApewfa/DL4KqayoEDn/VuMTmoWWl
 zWOsqj6Kbw+bQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 20 Aug 2024 12:50:23 +0200
X-ME-IP: 90.11.132.44
Message-ID: <d35a962d-dc95-4469-867e-95b704cca474@wanadoo.fr>
Date: Tue, 20 Aug 2024 12:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Stanner <pstanner@redhat.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-10-pstanner@redhat.com>
 <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
 <3e4288bb7300f3fd0883ff07b75ae69d0532019b.camel@redhat.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <3e4288bb7300f3fd0883ff07b75ae69d0532019b.camel@redhat.com>
Cc: linux-doc@vger.kernel.org, alvaro.karsz@solid-run.com,
 linux-pci@vger.kernel.org, linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, xuanzhuo@linux.alibaba.com,
 corbet@lwn.net, brgl@bgdev.pl, mst@redhat.com, eperezma@redhat.com,
 joabreu@synopsys.com, trix@redhat.com, kuba@kernel.org, pabeni@redhat.com,
 jasowang@redhat.com, hao.wu@intel.com, axboe@kernel.dk,
 richardcochran@gmail.com, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 christophe.jaillet@wanadoo.fr, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org, andy@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yilun.xu@intel.com, mcoquelin.stm32@gmail.com,
 mdf@kernel.org, linux-fpga@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH 8/9] vdap: solidrun: Replace deprecated
	PCI functions
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

TGUgMjAvMDgvMjAyNCDDoCAxMDowOSwgUGhpbGlwcCBTdGFubmVyIGEgw6ljcml0wqA6Cj4+PiBA
QCAtNTU2LDMzICs1NTYsMjQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMK
Pj4+IHNuZXRfY29uZmlnX29wcyA9IHsKPj4+ICDCoCBzdGF0aWMgaW50IHBzbmV0X29wZW5fcGZf
YmFyKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBzdHJ1Y3QgcHNuZXQKPj4+ICpwc25ldCkKPj4+ICDC
oCB7Cj4+PiAgwqDCoAljaGFyIG5hbWVbNTBdOwo+Pj4gLQlpbnQgcmV0LCBpLCBtYXNrID0gMDsK
Pj4+ICsJaW50IGk7Cj4+PiArCj4+PiArCXNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwgInBz
bmV0WyVzXS1iYXJzIiwKPj4+IHBjaV9uYW1lKHBkZXYpKTsKPj4+ICsKPj4+ICDCoMKgCS8qIFdl
IGRvbid0IGtub3cgd2hpY2ggQkFSIHdpbGwgYmUgdXNlZCB0byBjb21tdW5pY2F0ZS4uCj4+PiAg
wqDCoAkgKiBXZSB3aWxsIG1hcCBldmVyeSBiYXIgd2l0aCBsZW4gPiAwLgo+Pj4gIMKgwqAJICoK
Pj4+ICDCoMKgCSAqIExhdGVyLCB3ZSB3aWxsIGRpc2NvdmVyIHRoZSBCQVIgYW5kIHVubWFwIGFs
bCBvdGhlcgo+Pj4gQkFScy4KPj4+ICDCoMKgCSAqLwo+Pj4gIMKgwqAJZm9yIChpID0gMDsgaSA8
IFBDSV9TVERfTlVNX0JBUlM7IGkrKykgewo+Pj4gLQkJaWYgKHBjaV9yZXNvdXJjZV9sZW4ocGRl
diwgaSkpCj4+PiAtCQkJbWFzayB8PSAoMSA8PCBpKTsKPj4+IC0JfQo+Pj4gLQo+Pj4gLQkvKiBO
byBCQVIgY2FuIGJlIHVzZWQuLiAqLwo+Pj4gLQlpZiAoIW1hc2spIHsKPj4+IC0JCVNORVRfRVJS
KHBkZXYsICJGYWlsZWQgdG8gZmluZCBhIFBDSSBCQVJcbiIpOwo+Pj4gLQkJcmV0dXJuIC1FTk9E
RVY7Cj4+PiAtCX0KPj4+IC0KPj4+IC0Jc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAicHNu
ZXRbJXNdLWJhcnMiLAo+Pj4gcGNpX25hbWUocGRldikpOwo+Pj4gLQlyZXQgPSBwY2ltX2lvbWFw
X3JlZ2lvbnMocGRldiwgbWFzaywgbmFtZSk7Cj4+PiAtCWlmIChyZXQpIHsKPj4+IC0JCVNORVRf
RVJSKHBkZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBhbmQgbWFwIFBDSQo+Pj4gQkFSc1xuIik7Cj4+
PiAtCQlyZXR1cm4gcmV0Owo+Pj4gLQl9Cj4+PiArCQlpZiAocGNpX3Jlc291cmNlX2xlbihwZGV2
LCBpKSkgewo+Pj4gKwkJCXBzbmV0LT5iYXJzW2ldID0gcGNpbV9pb21hcF9yZWdpb24ocGRldiwK
Pj4+IGksIG5hbWUpOwo+Pgo+PiBIaSwKPj4KPj4gVW5yZWxhdGVkIHRvIHRoZSBwYXRjaCwgYnV0
IGlzIGlzIHNhZmUgdG8gaGF2ZSAnbmFtZScgYmUgb24gdGhlCj4+IHN0YWNrPwo+Pgo+PiBwY2lt
X2lvbWFwX3JlZ2lvbigpCj4+IC0tPiBfX3BjaW1fcmVxdWVzdF9yZWdpb24oKQo+PiAtLT4gX19w
Y2ltX3JlcXVlc3RfcmVnaW9uX3JhbmdlKCkKPj4gLS0+IHJlcXVlc3RfcmVnaW9uKCkgb3IgX19y
ZXF1ZXN0X21lbV9yZWdpb24oKQo+PiAtLT4gX19yZXF1ZXN0X3JlZ2lvbigpCj4+IC0tPiBfX3Jl
cXVlc3RfcmVnaW9uX2xvY2tlZCgpCj4+IC0tPiByZXMtPm5hbWUgPSBuYW1lOwo+Pgo+PiBTbyBh
biBhZGRyZXNzIG9uIHRoZSBzdGFjayBlbmRzIGluIHRoZSAnbmFtZScgZmllbGQgb2YgYSAic3Ry
dWN0Cj4+IHJlc291cmNlIi4KPiAKPiBPaCBvaC4uLgo+IAo+Pgo+PiBBY2NvcmRpbmcgdG8gYSBm
ZXcgZ3JlcCwgaXQgbG9va3MgcmVhbGx5IHVudXN1YWwuCj4+Cj4+IEkgZG9uJ3Qga25vdyBpZiBp
dCBpcyB1c2VkLCBidXQgaXQgbG9va3Mgc3RyYW5nZSB0byBtZS4KPiAKPiAKPiBJIGhhdmUgc2Vl
biBpdCB1c2VkIGluIHRoZSBrZXJuZWwgcmluZ2J1ZmZlciBsb2cgd2hlbiB5b3UgdHJ5IHRvCj4g
cmVxdWVzdCBzb21ldGhpbmcgdGhhdCdzIGFscmVhZHkgb3duZWQuIEkgdGhpbmsgaXQncyBoZXJl
LCByaWdodCBpbgo+IF9fcmVxdWVzdF9yZWdpb25fbG9ja2VkKCk6Cj4gCj4gLyoKPiAgICogbW0v
aG1tLmMgcmVzZXJ2ZXMgcGh5c2ljYWwgYWRkcmVzc2VzIHdoaWNoIHRoZW4KPiAgICogYmVjb21l
IHVuYXZhaWxhYmxlIHRvIG90aGVyIHVzZXJzLiAgQ29uZmxpY3RzIGFyZQo+ICAgKiBub3QgZXhw
ZWN0ZWQuICBXYXJuIHRvIGFpZCBkZWJ1Z2dpbmcgaWYgZW5jb3VudGVyZWQuCj4gICAqLwo+IGlm
IChjb25mbGljdC0+ZGVzYyA9PSBJT1JFU19ERVNDX0RFVklDRV9QUklWQVRFX01FTU9SWSkgewo+
IAlwcl93YXJuKCJVbmFkZHJlc3NhYmxlIGRldmljZSAlcyAlcFIgY29uZmxpY3RzIHdpdGggJXBS
IiwKPiAJCWNvbmZsaWN0LT5uYW1lLCBjb25mbGljdCwgcmVzKTsKPiB9Cj4gCj4gCj4gQXNzdW1p
bmcgSSBpbnRlcnByZXQgdGhlIGNvZGUgY29ycmVjdGx5Ogo+IFRoZSBjb25mbGljdGluZyByZXNv
dXJjZSBpcyBmb3VuZCB3aGVuIGEgbmV3IGNhbGxlciAoZS5nLiBhbm90aGVyCj4gZHJpdmVyKSB0
cmllcyB0byBnZXQgdGhlIHNhbWUgcmVnaW9uLiBTbyBjb25mbGljdC0+bmFtZSBvbiB0aGUgb3Jp
Z2luYWwKPiByZXF1ZXN0ZXIncyBzdGFjayBpcyBieSBub3cgZ29uZSBhbmQgeW91IGRvIGdldCBV
Qi4KPiAKPiBWZXJ5IHVubGlrZWx5IFVCLCBzaW5jZSBvbmx5IHJhcmVseSBkcml2ZXJzIHJhY2Ug
Zm9yIHRoZSBzYW1lIHJlc291cmNlLAo+IGJ1dCBzdGlsbCBVQi4KPiAKPiBCdXQgdGhlcmUncyBh
bHNvIGEgZmV3IG90aGVyIHBsYWNlcy4gR3JlcCBmb3IgImNvbmZsaWN0LT5uYW1lIi4KPiAKPj4K
Pj4KPj4gSWYgaXQgaXMgYW4gaXNzdWUsIGl0IHdhcyBhcHBhcmVudGx5IGFscmVhZHkgdGhlcmUg
YmVmb3JlIHRoaXMgcGF0Y2guCj4gCj4gSSB0aGluayB0aGlzIGhhcyB0byBiZSBmaXhlZC4KPiAK
PiBRdWVzdGlvbiB3b3VsZCBqdXN0IGJlIHdoZXRoZXIgb25lIHdhbnRzIHRvIGZpeCBpdCBsb2Nh
bGx5IGluIHRoaXMKPiBkcml2ZXIsIG9yIHByZXZlbnQgaXQgZnJvbSBoYXBwZW5pbmcgZ2xvYmFs
bHkgYnkgbWFraW5nIHRoZSBjb21tb24KPiBpbmZyYXN0cnVjdHVyZSBjb3B5IHRoZSBzdHJpbmcu
Cj4gCj4gCj4gUC4KPiAKCk5vdCBhIHBlcmZlY3Qgc2NyaXB0LCBidXQgdGhlIGJlbG93IGNvY2Np
bmVsbGUgc2NyaXB0IG9ubHkgZmluZCB0aGlzIApwbGFjZSwgc28gSSB3b3VsZCArMSBvbmx5IGZp
eGluZyB0aGluZ3MgaGVyZSBvbmx5LgoKQWdyZWU/CgpDSgoKCgpAQAppZGVudGlmaWVyIG5hbWU7
CmV4cHJlc3Npb24geDsKY29uc3RhbnQgTjsKQEAKCWNoYXIgbmFtZVtOXTsKCS4uLgooCioJcGNp
bV9pb21hcF9yZWdpb24oLi4uLCBuYW1lLCAuLi4pOwp8CioJcGNpbV9pb21hcF9yZWdpb25zKC4u
LiwgbmFtZSwgLi4uKTsKfAoqCXJlcXVlc3RfcmVnaW9uKC4uLiwgbmFtZSwgLi4uKTsKfAoqCXgg
PSBwY2ltX2lvbWFwX3JlZ2lvbiguLi4sIG5hbWUsIC4uLik7CnwKKgl4ID0gcGNpbV9pb21hcF9y
ZWdpb25zKC4uLiwgbmFtZSwgLi4uKTsKfAoqCXggPSByZXF1ZXN0X3JlZ2lvbiguLi4sIG5hbWUs
IC4uLik7CikKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
