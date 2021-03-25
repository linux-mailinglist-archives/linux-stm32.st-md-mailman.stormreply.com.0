Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637B348899
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 06:40:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8DE0C57B5E;
	Thu, 25 Mar 2021 05:40:56 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC8D3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 05:40:53 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id b10so750931iot.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 22:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5ZJuZyG5EyUyV+P4POHr63Z6WBq4xJYiTvaFchgclQI=;
 b=enGvwYzYJhFRdA5LENa9xHVplo2yJzy2G+NKOkmYljnWTZntst8oqdA1nmv1c7wIv0
 P9WtFcTcloxZ61Ag8dkqBZR1jNFAzT8ox3S26lbBFBBHUJwfPsAnHEh6tvS8dbO3ehW0
 LIjNgg5RG9mYg+mowcyU3juDB9eqzD1LuMI4bSzdRdU51xFcA+uU2QXhQcZRu/biGqbv
 UWBlnyI9uvZNfFz5ENaAuBoTtKycJaJkb8C84ODshJ3F6yaRtyKCFKqhE083ecPfrGgX
 ArGaadbQU1q0oPc2VY2JhAZ7A00J6tjfkd3ltsiZ6CNPrtnudsk8zMZuRhW+y3pKJPDJ
 f5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5ZJuZyG5EyUyV+P4POHr63Z6WBq4xJYiTvaFchgclQI=;
 b=ul4oJrA5wU0pOT8Y/2nGiXpB7DWPdhB4FxjYWPyCG/rzHrOldMQZHa2YmvHTe8Suqa
 omErQEfK+5/6X6YWfE9LzshdX69uORIrTo0z3BhkMoL6ewCXvAg6qDQHmu8Xo0VU8Ikg
 zgjezgz5T0V5o1uarYseHeCtUc7npsrlwQap9qmWldZKTO36XohOYcBs0duLuD7Gyalx
 CwGMYk9pdwI5LPRWRWx43cHkrykeojIH83o5dxfdpUyWJ5MH3iupBi8KYL8NsYMxzJd5
 SeUMwPaiHsKMVdZKYGSJAeKNVgQr7G8DnNx+t4xI5q8UOk6SvKXu0z5+UODSHumhQZqR
 e2Ug==
X-Gm-Message-State: AOAM530M9nszv1r2n2mc0larxGf8pzm2R7HkJESa9YmV/ZyxF+Dxjpzp
 UcVVQWNlK3RAzX5O6pjPBPm0G1uKOKK1uAotziE=
X-Google-Smtp-Source: ABdhPJxkLmUszGSoe7SOp77M3RTyBJYMqnmTo2KjwjsX9TQbTc9REpxEGUAdxAS9JWBtNdJjwNljleAbH0UU9cea6UU=
X-Received: by 2002:a05:6638:d47:: with SMTP id d7mr6042430jak.2.1616650852714; 
 Wed, 24 Mar 2021 22:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
 <1615801436-3016-10-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0Lfj+n4uk2rT8QnDtRveHn2gLx4ut6fLCByt0w9e08vwQ@mail.gmail.com>
 <01c9f635-7b2b-fc9c-3cf9-6d7f425d683e@foss.st.com>
 <CAL9mu0LaWyhb0=CdJgrfq8v08P2cgKSx8g=u3MJU=dRQc8bThw@mail.gmail.com>
 <20210324174525.GA3309477@robh.at.kernel.org>
In-Reply-To: <20210324174525.GA3309477@robh.at.kernel.org>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 25 Mar 2021 13:40:16 +0800
Message-ID: <CAL9mu0+g0fRGNzZp7Mbxd0to6B1gSGvgFFtNcSzB=-h3Y6G92Q@mail.gmail.com>
To: Rob Herring <robh@kernel.org>,
 Valentin CARON - foss <valentin.caron@foss.st.com>, 
 Alexandre TORGUE <Alexandre.torgue@foss.st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, rong.a.chen@intel.com,
 gregkh@linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, erwan.leray@st.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 afzal.mohd.ma@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lkp@intel.com
Subject: Re: [Linux-stm32] [PATCH v3 9/9] dt-bindings: serial: stm32: add
 phandle 'bluetooth' to fix dtbs_check warrning
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

SGkgUm9iLAoKVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4KCgpPbiBUaHUsIE1hciAyNSwgMjAy
MSBhdCAxOjQ1IEFNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24g
RnJpLCBNYXIgMTksIDIwMjEgYXQgMDc6MTM6MjdQTSArMDgwMCwgZGlsbG9uIG1pbiB3cm90ZToK
PiA+IEhpIEFsZXhhbmRyZSwKPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSByZXBseS4KPiA+Cj4gPiBP
biBGcmksIE1hciAxOSwgMjAyMSBhdCA0OjM4IFBNIEFsZXhhbmRyZSBUT1JHVUUKPiA+IDxhbGV4
YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgRGlsbG9uCj4g
PiA+Cj4gPiA+IE9uIDMvMTkvMjEgNToyOCBBTSwgZGlsbG9uIG1pbiB3cm90ZToKPiA+ID4gPiBO
byBjaGFuZ2VzLCBKdXN0IGxvb3AgbGtwIGluLgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBIaSBs
a3AsCj4gPiA+ID4KPiA+ID4gPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIHRoYW5rcyBmb3Ig
eW91ciByZXBvcnQuCj4gPiA+ID4gVGhpcyBwYXRjaCBpcyB0byBmaXggdGhlIGJ1aWxkIHdhcm5p
bmcgbWVzc2FnZS4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcy4KPiA+ID4gPiBSZWdhcmRzCj4gPiA+
ID4KPiA+ID4gPiBPbiBNb24sIE1hciAxNSwgMjAyMSBhdCA1OjQ1IFBNIDxkaWxsb24ubWluZmVp
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4+Cj4gPiA+ID4+IEZyb206IGRpbGxvbiBtaW4gPGRp
bGxvbi5taW5mZWlAZ21haWwuY29tPgo+ID4gPiA+Pgo+ID4gPiA+PiB3aGVuIHJ1biBtYWtlIGR0
YnNfY2hlY2sgd2l0aCAnYmx1ZXRvb3RoaSBicmNtLGJjbTQzNDM4LWJ0Jwo+ID4gPiA+PiBkdHMg
ZW5hYmxlZCBvbiBzdG0zMmg3LCB0aGVyZSBpcyBhIHdhcnJuaW5nIHBvcHVwOgo+ID4gPiA+Pgo+
ID4gPiA+Pj4+IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyaDc1MGktYXJ0LXBpLmR0LnlhbWw6IHNl
cmlhbEA0MDAwNDgwMDogJ2JsdWV0b290aCcKPiA+ID4gPj4gICAgIGRvZXMgbm90IG1hdGNoIGFu
eSBvZiB0aGUgcmVnZXhlczogJ3BpbmN0cmwtWzAtOV0rJwo+ID4gPiA+Pgo+ID4gPiA+PiB0byBt
YWtlIGR0YnNfY2hlY2sgaGFwcHksIHNvIGFkZCBhIHBoYW5kbGUgYmx1ZXRvb3RoCj4gPiA+ID4+
Cj4gPiA+ID4+IEZpeGVzOiA1MDBjZGIyM2Q2MDggKCJBUk06IGR0czogc3RtMzI6IEFkZCBTVE0z
Mkg3NDMgTUNVIGFuZCBTVE0zMkg3NDNpLUVWQUwgYm9hcmQiKQo+ID4gPiA+PiBTaWduZWQtb2Zm
LWJ5OiBkaWxsb24gbWluIDxkaWxsb24ubWluZmVpQGdtYWlsLmNvbT4KPiA+ID4gPj4gUmVwb3J0
ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4gPiA+PiAtLS0KPiA+
ID4gPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3N0LHN0bTMy
LXVhcnQueWFtbCB8IDUgKysrKysKPiA+ID4gPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCj4gPiA+ID4+Cj4gPiA+ID4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3N0LHN0bTMyLXVhcnQueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvc3Qsc3RtMzItdWFydC55YW1sCj4gPiA+ID4+IGlu
ZGV4IDg2MzE2NzgyODNmOS4uNWU2NzQ4NDBlNjJkIDEwMDY0NAo+ID4gPiA+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3N0LHN0bTMyLXVhcnQueWFtbAo+
ID4gPiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3N0
LHN0bTMyLXVhcnQueWFtbAo+ID4gPiA+PiBAQCAtNTAsNiArNTAsMTEgQEAgcHJvcGVydGllczoK
PiA+ID4gPj4gICAgICAgbWluSXRlbXM6IDEKPiA+ID4gPj4gICAgICAgbWF4SXRlbXM6IDIKPiA+
ID4gPj4KPiA+ID4gPj4gKyAgYmx1ZXRvb3RoOgo+ID4gPiA+PiArICAgIHR5cGU6IG9iamVjdAo+
ID4gPiA+PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiA+ID4+ICsgICAgICBwaGFuZGxlcyB0byB0
aGUgdXNhcnQgY29udHJvbGxlciBhbmQgYmx1ZXRvb3RoCj4gPiA+ID4+ICsKPiA+ID4KPiA+ID4g
RG8gd2UgcmVhbGx5IG5lZWQgdG8gYWRkIHRoaXMgImdlbmVyaWMiIHByb3BlcnR5IGhlcmUgPyBZ
b3UgY291bGQgdGVzdAo+ID4gPiB3aXRob3V0IHRoZSAiQWRpdGlvbmFsUHJvcGVydGllczpGYWxz
ZSIuCj4gPiBZZXMsIGluZGVlZC4gd2UgaGF2ZSBubyByZWFzb24gdG8gYWRkIGEgZ2VuZXJpYyAn
Ymx1ZXRvb3RoJyBwcm9wZXJ0eQo+ID4gaW50byBzcGVjaWZpYyBzb2MncyBpbnRlcmZhY2UgeWFt
bC4KPiA+IEkgY2FuJ3QganVzdCByZW1vdmUgIkFkaXRpb25hbFByb3BlcnRpZXM6RmFsc2UiLCBl
bHNlIG1ha2UKPiA+IE89Li4va2VybmVsLWFydC8gZHRicyBkdGJzX2NoZWNrIHdpbGwgcnVuIGlu
dG8KPiA+Cj4gPiAvaG9tZS9mbWluL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zZXJpYWwvc3Qsc3RtMzItdWFydC55YW1sOgo+ID4gJ29uZU9mJyBjb25kaXRpb25hbCBm
YWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgo+ID4gJ3VuZXZhbHVhdGVkUHJvcGVydGllcycgaXMg
YSByZXF1aXJlZCBwcm9wZXJ0eQo+ID4gJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzJyBpcyBhIHJlcXVp
cmVkIHByb3BlcnR5Cj4gPiAuLi4KPiA+Cj4gPiBTbyAsIGkgd2lsbCByZXBsYWNlICJBZGl0aW9u
YWxQcm9wZXJ0aWVzOkZhbHNlIi4gd2l0aAo+ID4gdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxz
ZSwgZG8geW91IGFncmVlIHdpdGggdGhpcz8KPgo+IFRoaXMgaXMgb2theSBhcyBsb25nIGFzICdz
ZXJpYWwueWFtbCcgaXMgcmVmZXJlbmNlZCwgYnV0IHdpbGwgZXZlbnR1YWxseQo+IGZhaWwgaWYg
bm90ICh1bmV2YWx1YXRlZFByb3BlcnRpZXMgaXNuJ3QgYWN0dWFsbHkgaW1wbGVtZW50ZWQgeWV0
KS4KPgo+ID4gSWYgc28sIGkgd2lsbCBzZW5kIHBhdGNoIHY0IGxhdGVyLgo+Cj4gT3IgeW91IGNh
biBkbyB0aGlzOgo+Cj4gYWRkdGlvbmFsUHJvcGVydGllczoKPiAgIHR5cGU6IG9iamVjdAo+Cj4g
V2hpY2ggbWVhbnMgYW55IG90aGVyIHByb3BlcnR5IGhhcyB0byBiZSBhIG5vZGUuCj4KT2theSwg
SSBqdXN0IHRlc3QgeW91ciBwYXRjaCwgaXQncyBmaXhlZCBkdGJzX2NoZWNrIHdhcnJuaW5nIGFz
IHdlbGwuCkkgd2lsbCBtZXJnZSBpdCB0byBuZXh0IHN1Ym1pdCwgdGhhbmtzLgoKSGksIFZhbGVu
dGluIENBUk9O77yMCkNvdWxkIHlvdSBoZWxwIHRvIGRvdWJsZSBjaGVjayBpdCwgYWZ0ZXIgbXkg
djUgc3VibWl0ID8gdGhhbmtzIHNvIG11Y2guCgpSZWdhcmRzLgoKVmFsZW50Cj4gUm9iCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
