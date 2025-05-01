Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8FCAA5F12
	for <lists+linux-stm32@lfdr.de>; Thu,  1 May 2025 15:15:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6070BC78F87;
	Thu,  1 May 2025 13:15:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61FD7C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 May 2025 13:15:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8F76A49C7A;
 Thu,  1 May 2025 13:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA3CC4CEE4;
 Thu,  1 May 2025 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746105300;
 bh=6ptm9e4+N5Xyo1RCMVV1pfCM3SsY2ZQgu3Uh/K4ek1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J58UFm9gNYOlLCrcSO6OxX6RPkPjwASSoVPejxOPQtMgK6DVbO37HkxQPsLZz+kRv
 PAinzrv821hFUBbMok1HnTGoVqSxpm069Q2Pi2ZzbL4rtMQedEhK25DslHGQZtgGin
 Y/mhgOiRlU82tjDVUpLtpGYrufX6e1BP+38x2QYbY8P8rolHG4wcoVaToZxhb8iLSN
 mTm1I0OLFr4lrPW3fIz/8zYoGlqO5vAnzcqWkzgM/jmRZKCSPzxYs3JpX0fa7mEsPI
 ztfSGRgj3gDV7zwepeaIbQh78A2YmIr+AAS65Xo4LQ/btBt5PkjYrhB5GQLLzAOifi
 XOJ+FUPGOvwmg==
Date: Thu, 1 May 2025 14:14:54 +0100
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250501131454.GO1567507@google.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 daniel.lezcano@linaro.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 0/7] Add STM32MP25 LPTIM support: MFD,
 PWM, IIO, counter, clocksource
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

T24gVHVlLCAyOSBBcHIgMjAyNSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgoKPiBUaGlzIHNlcmll
cyBhZGRzIHN1cHBvcnQgZm9yIFNUTTMyTVAyNSB0byBNRkQgUFdNLCBJSU8sIGNvdW50ZXIgYW5k
Cj4gY2xvY2tzb3VyY2UgbG93LXBvd2VyIHRpbWVyIChMUFRJTSkgZHJpdmVycy4KPiBUaGlzIG5l
dyB2YXJpYW50IGlzIG1hbmFnZWQgYnkgdXNpbmcgYSBuZXcgRFQgY29tcGF0aWJsZSBzdHJpbmcs
IGhhcmR3YXJlCj4gY29uZmlndXJhdGlvbiBhbmQgdmVyc2lvbiByZWdpc3RlcnMuCj4gSXQgY29t
ZXMgd2l0aCBhIHNsaWdodGx5IHVwZGF0ZWQgcmVnaXN0ZXIgc2V0LCBzb21lIG5ldyBmZWF0dXJl
cyBhbmQgbmV3Cj4gaW50ZXJjb25uZWN0IHNpZ25hbHMgaW5zaWRlIHRoZSBTb0MuCj4gU2FtZSBm
ZWF0dXJlIGxpc3QgYXMgb24gU1RNMzJNUDF4IGlzIHN1cHBvcnRlZCBjdXJyZW50bHkuCj4gVGhl
IGRldmljZSB0cmVlIGZpbGVzIGFkZCBhbGwgaW5zdGFuY2VzIGluIHN0bTMybXAyNTEgZHRzaSBm
aWxlLgo+IAo+IENoYW5nZXMgaW4gVjYKPiAtLS0KPiAtIEZpeGVkIGtlcm5lbCB0ZXN0IHJvYm90
IHdhcm5pbmcKPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTA0
MjYxNDU2LmFDQVRCb1lOLWxrcEBpbnRlbC5jb20vCj4gCj4gQ2hhbmdlcyBpbiBWNQo+IC0tLQo+
IC0gQWRkIGEgbmVjZXNzYXJ5IGRlbGF5IGluIGNsb2Nrc291cmNlIGRyaXZlciwgd2hlbiBlbmFi
bGluZyB0aGUgdGltZXIuCj4gLSBBZGQgY29sbGVjdGVkIEFja3MKPiAtIERyb3BwZWQgSUlPIHRy
aWdnZXIgcGF0Y2ggYXMgYXBwbGllZCBieSBKb25hdGhhbiBbMV0gKG5vIGRlcGVuZGVuY3kpCj4g
ICBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMzMxMTEwNDM1LjI2MTU3ZWJl
QGppYzIzLWh1YXdlaS8KPiAKPiBDaGFuZ2VzIGluIFY0Cj4gLS0tCj4gLSBTaW1wbGlmeSBJSU8g
dHJpZ2dlciBkcml2ZXIgYXMgcGVyIEpvbmF0aGFuJ3MgY29tbWVudHMuCj4gLSBSZXdvcmsgY2xv
Y2tzb3VyY2UgZHJpdmVyOiBlbmNhcHN1bGF0ZSBtcDI1IGNoYW5nZXMgaW4gc2VwYXJhdGUgZnVu
Y3Rpb24KPiAgIGFmdGVyIERhbmllbCdzIHN1Z2dlc3Rpb24uCj4gLSBBZGQgc29tZSBkZWZpbml0
aW9ucyB0byBNRkQgaGVhZGVyLgo+IAo+IENoYW5nZXMgaW4gVjMKPiAtLS0KPiAtIFlhbWwgaW5k
ZW50YXRpb24gaXNzdWUgZml4ZWQsIHJlcG9ydGVkIGJ5IFJvYidzIGJvdAo+IAo+IENoYW5nZXMg
aW4gVjIKPiAtLS0KPiAtIFJldmlldyBjb21tZW50cyBmcm9tIEtyenlzenRvZgo+ICAgLSBBZG9w
dCBjb21wYXRpYmxlIGZhbGxiYWNrIGluIGR0LWJpbmRpbmdzIGFuZCBkcml2ZXIKPiAgIC0gZHJp
dmVyczogZHJvcCAic3Qsc3RtMzJtcDI1LS4uLiIgY29tcGF0aWJsZXMgd2hlbiB1bnVzZWQgKGUu
Zy4gbm8gLmRhdGEpCj4gICAtIGNvdW50ZXIgZHJpdmVyOiBubyB1cGRhdGUgKHBhdGNoIGRyb3Bw
ZWQpCj4gICAtIGRlZmNvbmZpZzogb25seSBlbmFibGUgdGhlIG5lY2Vzc2FyeSBjb25maWcgZm9y
IHVwc3RyZWFtIGJvYXJkCj4gICAtIGFkZCBscHRpbWVyIERUIG5vZGUgaW4gc3RtMzJtcDI1N2Yt
ZXYxIGJvYXJkCj4gLSBBZGQgbWlzc2luZyBtYW5hZ2VtZW50IG9mIElFUiBhY2Nlc3MgZm9yIHN0
bTMybXAyNQo+IAo+IEZhYnJpY2UgR2FzbmllciAoNyk6Cj4gICBkdC1iaW5kaW5nczogbWZkOiBz
dG0zMi1scHRpbWVyOiBhZGQgc3VwcG9ydCBmb3Igc3RtMzJtcDI1Cj4gICBtZmQ6IHN0bTMyLWxw
dGltZXI6IGFkZCBzdXBwb3J0IGZvciBzdG0zMm1wMjUKPiAgIGNsb2Nrc291cmNlOiBzdG0zMi1s
cHRpbWVyOiBhZGQgc3VwcG9ydCBmb3Igc3RtMzJtcDI1Cj4gICBwd206IHN0bTMyLWxwOiBhZGQg
c3VwcG9ydCBmb3Igc3RtMzJtcDI1Cj4gICBhcm02NDogZGVmY29uZmlnOiBlbmFibGUgU1RNMzIg
TFAgdGltZXIgY2xvY2tldmVudCBkcml2ZXIKPiAgIGFybTY0OiBkdHM6IHN0OiBhZGQgbG93LXBv
d2VyIHRpbWVyIG5vZGVzIG9uIHN0bTMybXAyNTEKPiAgIGFybTY0OiBkdHM6IHN0OiB1c2UgbHB0
aW1lcjMgYXMgdGljayBicm9hZGNhc3Qgc291cmNlIG9uCj4gICAgIHN0bTMybXAyNTdmLWV2MQo+
IAo+ICAuLi4vYmluZGluZ3MvbWZkL3N0LHN0bTMyLWxwdGltZXIueWFtbCAgICAgICAgfCAgNDAg
KysrLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAgICAgICAgfCAx
NzcgKysrKysrKysrKysrKysKPiAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1l
djEuZHRzICAgIHwgICA4ICsKPiAgYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyAgICAgICAg
ICAgICAgICAgIHwgICAyICsKPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdG0zMi1scC5j
ICAgICAgICAgIHwgIDYxICsrKystCj4gIGRyaXZlcnMvbWZkL3N0bTMyLWxwdGltZXIuYyAgICAg
ICAgICAgICAgICAgICB8ICAzMyArKy0KPiAgZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgICAg
ICAgICAgICAgICAgICAgIHwgMjE5ICsrKysrKysrKysrKysrKy0tLQo+ICBpbmNsdWRlL2xpbnV4
L21mZC9zdG0zMi1scHRpbWVyLmggICAgICAgICAgICAgfCAgMzcgKystCj4gIDggZmlsZXMgY2hh
bmdlZCwgNTM3IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQoKSXMgaXQganVzdCB0aGUg
Q2xvY2tzb3VyY2UgQWNrIHRoYXQgd2UncmUgd2FpdGluZyBvbiBub3c/CgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
