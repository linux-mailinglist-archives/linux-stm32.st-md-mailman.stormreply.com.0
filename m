Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 633C939F50A
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 13:33:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1592AC57B79;
	Tue,  8 Jun 2021 11:33:46 +0000 (UTC)
Received: from out28-217.mail.aliyun.com (out28-217.mail.aliyun.com
 [115.124.28.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 064AAC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 11:33:43 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07732842|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0809714-0.0100507-0.908978;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KPPW5GU_1623152014; 
Received: from 192.168.88.129(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KPPW5GU_1623152014)
 by smtp.aliyun-inc.com(10.147.41.137);
 Tue, 08 Jun 2021 19:33:36 +0800
To: Andrew Lunn <andrew@lunn.ch>
References: <1623086867-119039-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623086867-119039-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YL6zYgGdqxqL9c0j@lunn.ch>
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <6532a195-65db-afb3-37a2-f68bfed9d908@wanyeetech.com>
Date: Tue, 8 Jun 2021 19:33:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <YL6zYgGdqxqL9c0j@lunn.ch>
Content-Language: en-US
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
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

SGkgQW5kcmV3LAoKT24gMjAyMS82Lzgg5LiK5Y2IODowMSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+
ICAgY29uZmlnIERXTUFDX1JPQ0tDSElQCj4+ICAgCXRyaXN0YXRlICJSb2NrY2hpcCBkd21hYyBz
dXBwb3J0Igo+PiAtCWRlZmF1bHQgQVJDSF9ST0NLQ0hJUAo+PiArCWRlZmF1bHQgTUFDSF9ST0NL
Q0hJUAo+PiAgIAlkZXBlbmRzIG9uIE9GICYmIChBUkNIX1JPQ0tDSElQIHx8IENPTVBJTEVfVEVT
VCkKPj4gICAJc2VsZWN0IE1GRF9TWVNDT04KPj4gICAJaGVscAo+PiBAQCAtMTY0LDcgKzE3Niw3
IEBAIGNvbmZpZyBEV01BQ19TVEkKPj4gICAKPj4gICBjb25maWcgRFdNQUNfU1RNMzIKPj4gICAJ
dHJpc3RhdGUgIlNUTTMyIERXTUFDIHN1cHBvcnQiCj4+IC0JZGVmYXVsdCBBUkNIX1NUTTMyCj4+
ICsJZGVmYXVsdCBNQUNIX1NUTTMyCj4gSXQgd291bGQgYmUgZ29vZCB0byBleHBsYWluIGluIHRo
ZSBjb21taXQgbWVzc2FnZSB3aHkgeW91IGFyZSBjaGFuZ2luZwo+IHRoZXNlIHR3by4gSXQgaXMg
bm90IG9idmlvdXMuCgoKQXBvbG9naXplIGZvciBteSBjYXJlbGVzc25lc3MsIHRoaXMgaXMgbGVm
dCBvdmVyIGFjY2lkZW50YWxseSB3aGVuIApjbGVhbmluZyB1cCB0aGUgY29kZSwgSSB3aWxsIHJl
bW92ZSB0aGVtIGluIHRoZSBuZXh0IHZlcnNpb24uCgoKPgo+PiArc3RhdGljIGludCBqejQ3NzVf
bWFjX3NldF9tb2RlKHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQpCj4+ICt7
Cj4+ICsJc3RydWN0IGluZ2VuaWNfbWFjICptYWMgPSBwbGF0X2RhdC0+YnNwX3ByaXY7Cj4+ICsJ
aW50IHZhbDsKPj4gKwo+PiArCXN3aXRjaCAocGxhdF9kYXQtPmludGVyZmFjZSkgewo+PiArCWNh
c2UgUEhZX0lOVEVSRkFDRV9NT0RFX01JSToKPj4gKwkJdmFsID0gRklFTERfUFJFUChNQUNQSFlD
X1RYQ0xLX1NFTF9NQVNLLCBNQUNQSFlDX1RYQ0xLX1NFTF9JTlBVVCkgfAo+PiArCQkJICBGSUVM
RF9QUkVQKE1BQ1BIWUNfUEhZX0lORlRfTUFTSywgTUFDUEhZQ19QSFlfSU5GVF9NSUkpOwo+PiAr
CQlwcl9kZWJ1ZygiTUFDIFBIWSBDb250cm9sIFJlZ2lzdGVyOiBQSFlfSU5URVJGQUNFX01PREVf
TUlJXG4iKTsKPj4gKwkJYnJlYWs7Cj4+ICsKPj4gKwljYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9H
TUlJOgo+PiArCQl2YWwgPSBGSUVMRF9QUkVQKE1BQ1BIWUNfVFhDTEtfU0VMX01BU0ssIE1BQ1BI
WUNfVFhDTEtfU0VMX0lOUFVUKSB8Cj4+ICsJCQkgIEZJRUxEX1BSRVAoTUFDUEhZQ19QSFlfSU5G
VF9NQVNLLCBNQUNQSFlDX1BIWV9JTkZUX0dNSUkpOwo+PiArCQlwcl9kZWJ1ZygiTUFDIFBIWSBD
b250cm9sIFJlZ2lzdGVyOiBQSFlfSU5URVJGQUNFX01PREVfR01JSVxuIik7Cj4+ICsJCWJyZWFr
Owo+PiArCj4+ICsJY2FzZSBQSFlfSU5URVJGQUNFX01PREVfUk1JSToKPj4gKwkJdmFsID0gRklF
TERfUFJFUChNQUNQSFlDX1RYQ0xLX1NFTF9NQVNLLCBNQUNQSFlDX1RYQ0xLX1NFTF9JTlBVVCkg
fAo+PiArCQkJICBGSUVMRF9QUkVQKE1BQ1BIWUNfUEhZX0lORlRfTUFTSywgTUFDUEhZQ19QSFlf
SU5GVF9STUlJKTsKPj4gKwkJcHJfZGVidWcoIk1BQyBQSFkgQ29udHJvbCBSZWdpc3RlcjogUEhZ
X0lOVEVSRkFDRV9NT0RFX1JNSUlcbiIpOwo+PiArCQlicmVhazsKPj4gKwo+PiArCWNhc2UgUEhZ
X0lOVEVSRkFDRV9NT0RFX1JHTUlJOgo+IFdoYXQgYWJvdXQgdGhlIG90aGVyIHRocmVlIFJHTUlJ
IG1vZGVzPwo+Cj4+ICsJY2FzZSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUk6Cj4+ICsJCXZhbCA9
IEZJRUxEX1BSRVAoTUFDUEhZQ19UWF9TRUxfTUFTSywgTUFDUEhZQ19UWF9TRUxfREVMQVkpIHwK
Pj4gKwkJCSAgRklFTERfUFJFUChNQUNQSFlDX1RYX0RFTEFZX01BU0ssIE1BQ1BIWUNfVFhfREVM
QVlfNjNfVU5JVCkgfAo+PiArCQkJICBGSUVMRF9QUkVQKE1BQ1BIWUNfUlhfU0VMX01BU0ssIE1B
Q1BIWUNfUlhfU0VMX09SSUdJTikgfAo+PiArCQkJICBGSUVMRF9QUkVQKE1BQ1BIWUNfUEhZX0lO
RlRfTUFTSywgTUFDUEhZQ19QSFlfSU5GVF9SR01JSSk7Cj4gV2hhdCBleGFjdGx5IGRvZXMgTUFD
UEhZQ19UWF9ERUxBWV82M19VTklUIG1lYW4gaGVyZT8gSWRlYWxseSwgdGhlIE1BQwo+IHNob3Vs
ZCBub3QgYmUgYWRkaW5nIGFueSBSR01JSSBkZWxheXMuIEl0IHNob3VsZCBob3dldmVyIHBhc3Mg
bW9kZQo+IHRocm91Z2ggdG8gdGhlIFBIWSwgc28gaXQgY2FuIGFkZCB0aGUgZGVsYXlzLCBpZiB0
aGUgbW9kZSBpbmRpY2F0ZXMgaXQKPiBzaG91bGQsIGUuZy4gUEhZX0lOVEVSRkFDRV9NT0RFX1JH
TUlJX0lELiBUaGlzIGlzIGFsc28gd2h5IHlvdSBzaG91bGQKPiBiZSBoYW5kbGluZyBhbGwgNCBS
R01JSSBtb2RlcyBoZXJlLCBub3QganVzdCBvbmUuCgoKTUFDUEhZQ19UWF9ERUxBWV82M19VTklU
IG1lYW5zIHNldCBNQUMgVFggY2xrIGRlbGF5IHRvIDYzIHVuaXRzIChzaW1pbGFyIHRvIHRoZSAi
dHgtZGVsYXkiIGluIGR3bWFjLXJrLmMpLiBIb3dldmVyLCB0aGUgbWFudWFsIGRvZXMgbm90IGNs
ZWFybHkgZGVzY3JpYmUgdGhlIHRpbWUgc3BhbiBvZiBvbmUgdW5pdCwgYWZ0ZXIgY29uc3VsdGlu
ZyBlbmdpbmVlciBvZiBJbmdlbmljLCBJIGxlYXJuZWQgdGhhdCB0aGUgdmFsdWUgaXMgcmVjb21t
ZW5kZWQgdG8gYmUgc2V0IHRvIDYzLgpJIHdpbGwgY2hhbmdlIGl0IHRvIGJlIHNpbWlsYXIgdG8g
dGhlIHdheSBkb25lIGluIGR3bWFjLXJrLmMuCgpUaGFua3MgYW5kIGJlc3QgcmVnYXJkcyEKCgo+
Cj4gCSBBbmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
