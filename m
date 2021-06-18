Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF53AD323
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Jun 2021 21:50:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E22E8C59780;
	Fri, 18 Jun 2021 19:50:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3EA9C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 19:50:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C179610A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 19:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624045838;
 bh=Olzy7g261M2VzBHP3yNFLi2kVn+AxxWpUNxI0dmBqcc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dcP4F/onnC+AOTwEh+lLoHTFig1Ba3jo+I4fjjCvYFbLZbVPvhtCidPPAwY/NkJIT
 jS8iPQktgF4ztiwk8UTas962qqssLW0P29WJX2/lUIOrJGsb6gc7DjFb3lBxz2itjF
 0mszurdnDaFarK1TslyM/1ieSnyBbG79y5AU1JZD4EcUXHViPgj5OuQu/g2xAkPwdk
 FEuJlWIMIKRZSEfkLA17KhLw6b4Jv4AzZ6FdFtt8MN2EkoUl15Sj/adadfGjgiVF1O
 pj58nvIs4hSfj8TmN+B/CfujaHHguA1jxkuZj/rM/t5sJUq5snviGXyQ6epvkVogp1
 wVRYM/P5WJeyw==
Received: by mail-ej1-f42.google.com with SMTP id he7so17497411ejc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 12:50:38 -0700 (PDT)
X-Gm-Message-State: AOAM533mFeA4RCjXZCaejVoRp4oQ05D7fnwm8MpctjeRt4/lZyBwcDA3
 ASYCSFZqeaFH8s41SNvFMVsuZBU1il0G39aS2w==
X-Google-Smtp-Source: ABdhPJwKAurPVIO13QjaLe6oUgNoXTxDg/+T34lz/ida9mpMP6fVsLehR3G6dZmNY0InmWB6h6ecN/5xS0kNaklg6CQ=
X-Received: by 2002:a17:907:2059:: with SMTP id
 pg25mr12140038ejb.130.1624045836720; 
 Fri, 18 Jun 2021 12:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
 <CAL_Jsq+7v6GRMfxWhA6g2r0GaZSO_AztgSz7rheJsE9jKYd8uQ@mail.gmail.com>
 <20210616154526.54481912@zhouyanjie-virtual-machine>
 <20210617112400.5e68c172@zhouyanjie-virtual-machine>
In-Reply-To: <20210617112400.5e68c172@zhouyanjie-virtual-machine>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 18 Jun 2021 13:50:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJW_L3TXTy89Y6YOyQzGzOeN3g1D7pwbuGmSW6TFaO4nA@mail.gmail.com>
Message-ID: <CAL_JsqJW_L3TXTy89Y6YOyQzGzOeN3g1D7pwbuGmSW6TFaO4nA@mail.gmail.com>
To: =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 sernia.zhou@foxmail.com, jun.jiang@ingenic.com, rick.tyliu@ingenic.com,
 netdev <netdev@vger.kernel.org>, sihui.liu@ingenic.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jose Abreu <joabreu@synopsys.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 dongsheng.qiu@ingenic.com, David Miller <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: dwmac: Add bindings
	for new Ingenic SoCs.
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

T24gV2VkLCBKdW4gMTYsIDIwMjEgYXQgOToyNCBQTSDlkajnkLDmnbAgPHpob3V5YW5qaWVAd2Fu
eWVldGVjaC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4g5LqOIFdlZCwgMTYgSnVuIDIwMjEg
MTU6NDU6MjYgKzA4MDAKPiDlkajnkLDmnbAgPHpob3V5YW5qaWVAd2FueWVldGVjaC5jb20+IOWG
memBkzoKPgo+ID4gSGkgUm9iLAo+ID4KPiA+IOS6jiBUdWUsIDE1IEp1biAyMDIxIDE3OjA1OjQ1
IC0wNjAwCj4gPiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPiDlhpnpgZM6Cj4gPgo+
ID4gPiBPbiBNb24sIEp1biAxNCwgMjAyMSBhdCAxMToxOCBBTSDlkajnkLDmnbAgKFpob3UgWWFu
amllKQo+ID4gPiA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+
ID4gPiBBZGQgdGhlIGR3bWFjIGJpbmRpbmdzIGZvciB0aGUgSlo0Nzc1IFNvQywgdGhlIFgxMDAw
IFNvQywKPiA+ID4gPiB0aGUgWDE2MDAgU29DLCB0aGUgWDE4MzAgU29DIGFuZCB0aGUgWDIwMDAg
U29DIGZyb20gSW5nZW5pYy4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IOWRqOeQsOad
sCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamllQHdhbnllZXRlY2guY29tPgo+ID4gPiA+IC0tLQo+
ID4gPiA+Cj4gPiA+ID4gTm90ZXM6Cj4gPiA+ID4gICAgIHYxLT52MjoKPiA+ID4gPiAgICAgTm8g
Y2hhbmdlLgo+ID4gPiA+Cj4gPiA+ID4gICAgIHYyLT52MzoKPiA+ID4gPiAgICAgQWRkICJpbmdl
bmljLG1hYy55YW1sIiBmb3IgSW5nZW5pYyBTb0NzLgo+ID4gPiA+Cj4gPiA+ID4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9pbmdlbmljLG1hYy55YW1sICAgICAgIHwgNzYKPiA+ID4gPiAr
KysrKysrKysrKysrKysrKysrKysrIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3
bWFjLnlhbWwKPiA+ID4gPiB8IDE1ICsrKysrIDIgZmlsZXMgY2hhbmdlZCwgOTEgaW5zZXJ0aW9u
cygrKQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L2luZ2VuaWMsbWFjLnlhbWwKPiA+ID4gPgo+ID4gPiA+IGRp
ZmYgLS1naXQKPiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
aW5nZW5pYyxtYWMueWFtbAo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9pbmdlbmljLG1hYy55YW1sIG5ldyBmaWxlCj4gPiA+ID4gbW9kZSAxMDA2NDQgaW5k
ZXggMDAwMDAwMDAuLjVmZTJlODEgLS0tIC9kZXYvbnVsbAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbAo+ID4gPiA+IEBA
IC0wLDAgKzEsNzYgQEAKPiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+ID4gKyVZQU1MIDEuMgo+ID4gPiA+ICstLS0K
PiA+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9uZXQvaW5nZW5pYyxt
YWMueWFtbCMKPiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCj4gPiA+ID4gKwo+ID4gPiA+ICt0aXRsZTogQmluZGluZ3MgZm9yIE1B
QyBpbiBJbmdlbmljIFNvQ3MKPiA+ID4gPiArCj4gPiA+ID4gK21haW50YWluZXJzOgo+ID4gPiA+
ICsgIC0g5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgPHpob3V5YW5qaWVAd2FueWVldGVjaC5jb20+
Cj4gPiA+ID4gKwo+ID4gPiA+ICtkZXNjcmlwdGlvbjoKPiA+ID4gPiArICBUaGUgRXRoZXJuZXQg
TWVkaWEgQWNjZXNzIENvbnRyb2xsZXIgaW4gSW5nZW5pYyBTb0NzLgo+ID4gPiA+ICsKPiA+ID4g
PiArcHJvcGVydGllczoKPiA+ID4gPiArICBjb21wYXRpYmxlOgo+ID4gPiA+ICsgICAgZW51bToK
PiA+ID4gPiArICAgICAgLSBpbmdlbmljLGp6NDc3NS1tYWMKPiA+ID4gPiArICAgICAgLSBpbmdl
bmljLHgxMDAwLW1hYwo+ID4gPiA+ICsgICAgICAtIGluZ2VuaWMseDE2MDAtbWFjCj4gPiA+ID4g
KyAgICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMKPiA+ID4gPiArICAgICAgLSBpbmdlbmljLHgyMDAw
LW1hYwo+ID4gPiA+ICsKPiA+ID4gPiArICByZWc6Cj4gPiA+ID4gKyAgICBtYXhJdGVtczogMQo+
ID4gPiA+ICsKPiA+ID4gPiArICBpbnRlcnJ1cHRzOgo+ID4gPiA+ICsgICAgbWF4SXRlbXM6IDEK
PiA+ID4gPiArCj4gPiA+ID4gKyAgaW50ZXJydXB0LW5hbWVzOgo+ID4gPiA+ICsgICAgY29uc3Q6
IG1hY2lycQo+ID4gPiA+ICsKPiA+ID4gPiArICBjbG9ja3M6Cj4gPiA+ID4gKyAgICBtYXhJdGVt
czogMQo+ID4gPiA+ICsKPiA+ID4gPiArICBjbG9jay1uYW1lczoKPiA+ID4gPiArICAgIGNvbnN0
OiBzdG1tYWNldGgKPiA+ID4gPiArCj4gPiA+ID4gKyAgbW9kZS1yZWc6Cj4gPiA+ID4gKyAgICBk
ZXNjcmlwdGlvbjogQW4gZXh0cmEgc3lzY29uIHJlZ2lzdGVyIHRoYXQgY29udHJvbCBldGhlcm5l
dAo+ID4gPiA+IGludGVyZmFjZSBhbmQgdGltaW5nIGRlbGF5Cj4gPiA+Cj4gPiA+IE5lZWRzIGEg
dmVuZG9yIHByZWZpeCBhbmQgdHlwZS4KPiA+ID4KPiA+ID4gPiArCj4gPiA+ID4gKyAgcngtY2xr
LWRlbGF5LXBzOgo+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246IFJHTUlJIHJlY2VpdmUgY2xvY2sg
ZGVsYXkgZGVmaW5lZCBpbiBwaWNvCj4gPiA+ID4gc2Vjb25kcyArCj4gPiA+ID4gKyAgdHgtY2xr
LWRlbGF5LXBzOgo+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246IFJHTUlJIHRyYW5zbWl0IGNsb2Nr
IGRlbGF5IGRlZmluZWQgaW4gcGljbwo+ID4gPiA+IHNlY29uZHMgKwo+ID4gPiA+ICtyZXF1aXJl
ZDoKPiA+ID4gPiArICAtIGNvbXBhdGlibGUKPiA+ID4gPiArICAtIHJlZwo+ID4gPiA+ICsgIC0g
aW50ZXJydXB0cwo+ID4gPiA+ICsgIC0gaW50ZXJydXB0LW5hbWVzCj4gPiA+ID4gKyAgLSBjbG9j
a3MKPiA+ID4gPiArICAtIGNsb2NrLW5hbWVzCj4gPiA+ID4gKyAgLSBtb2RlLXJlZwo+ID4gPiA+
ICsKPiA+ID4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiA+ID4gKwo+ID4gPiA+
ICtleGFtcGxlczoKPiA+ID4gPiArICAtIHwKPiA+ID4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9jbG9jay94MTAwMC1jZ3UuaD4KPiA+ID4gPiArCj4gPiA+ID4gKyAgICBtYWM6IGV0aGVy
bmV0QDEzNGIwMDAwIHsKPiA+ID4gPiArICAgICAgICBjb21wYXRpYmxlID0gImluZ2VuaWMseDEw
MDAtbWFjIiwgInNucHMsZHdtYWMiOwo+ID4gPgo+ID4gPiBEb2Vzbid0IG1hdGNoIHRoZSBzY2hl
bWEuCj4gPgo+ID4gU29ycnkgZm9yIHRoYXQsIHNvbWVob3cgd2hlbiBJIHJ1biAibWFrZSBkdF9i
aW5kaW5nc19jaGVjayIsIHRoZXJlIGlzCj4gPiBubyB3YXJybmluZyBvciBlcnJvciBtZXNzYWdl
IGFib3V0IHRoaXMgZmlsZS4gSSBhbSBzdXJlIHRoYXQgeWFtbGxpbnQKPiA+IGlzIGluc3RhbGxl
ZCBhbmQgZHRzY2hlbWEgaGFzIGJlZW4gdXBncmFkZWQgdG8gMjAyMS42Lgo+Cj4gSSBmb3VuZCB0
aGF0IGl0IHNlZW1zIHRvIGJlIGJlY2F1c2UgNS4xMyBuZXdseSBpbnRyb2R1Y2VkCj4gIkRUX0NI
RUNLRVJfRkxBR1M9LW0iLCBhbmQgSSBhbSBzdGlsbCB1c2luZyB0aGUgb2xkCj4gIm1ha2UgZHRf
YmluZGluZ19jaGVjayIgY29tbWFuZCwgc28gdGhpcyBlcnJvciBpcyBub3QgcHJvbXB0ZWQuIE5v
dyBJCj4gY2FuIHNlZSB0aGlzIGVycm9yIG1lc3NhZ2UgYWZ0ZXIgdXNpbmcgdGhlCj4gIm1ha2Ug
RFRfQ0hFQ0tFUl9GTEFHUz0tbSBkdF9iaW5kaW5nX2NoZWNrIiBjb21tYW5kLCBhbmQgSSB3aWxs
IHNlbmQgYQo+IGZpeCBzb29uLgoKTm8sIHRoaXMgZXJyb3IgaGFzIG5vdGhpbmcgdG8gZG8gd2l0
aCB0aGUgJy1tJyBvcHRpb24uCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
