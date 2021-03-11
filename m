Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD88337C9A
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 19:26:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69D11C5718B;
	Thu, 11 Mar 2021 18:26:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA571C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/wSGYLh9BUQ/m4VK2E3Iu8L1K7AWw+HwFDDXH/P7x4=;
 b=Dt56iO4QJuJA+k3BrHjVi7X4akcMO+fRI3Op/0Vlc4YS1d0fSliXBiTt5M6YPh81npUeAo
 DONzHVH3vUzM3i7Q/rhj6Wb86BvX9R713O30qm86eYnTVWaw712H2o2v2ckbvL/zzFODWg
 NXs61CYptcr97lCFNI+HveKAq/RCz64=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-oaNE0eb1Pe2I-iemY0BVKw-1; Thu, 11 Mar 2021 13:26:38 -0500
X-MC-Unique: oaNE0eb1Pe2I-iemY0BVKw-1
Received: by mail-qk1-f198.google.com with SMTP id x11so13042181qki.22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 10:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7/wSGYLh9BUQ/m4VK2E3Iu8L1K7AWw+HwFDDXH/P7x4=;
 b=LmEKweoaAHYwckTcuKGrQvtBAsa/Qx7/bRQtmjNmxGUv1KQxG+F7TXbyckwhwiKdcW
 GFXQPPxWMbU+apcO47PTDrKyNIZbVCXfq0ToWntFT7meCLyIm+ibbnim/r4wAIoqv0lj
 6IKHdDGV9rOBJ7/+xf0570Y4q+2ksbO7Jt/5G8jWpdQ3W7yn0RQyiisNS8fcxLgeZRYI
 AD4xVSf/hxSlE61lHFx0V9OOgevzcio/gjclBripIL1VOrNvq90z+dV+Cg8W61lqdXtS
 3/9Cu5w97m4fFVqHBiWtgBcDIHNbEhSkj6Y6H74s+icSfFeR8UUN6JugXqnBRl52ju+6
 9IbA==
X-Gm-Message-State: AOAM532LiHX4hqsEzy/8wbaDeB9tJds/khW+dXnFUF102r/tRyUPQvnA
 5ep3eZA0kX4JI088c670RsNR3JJX5IfvF3CSNAmuwuNbk/9nV9eg4Jbwhq1aVWMn4kPmRSwKemc
 ErwoWA9NbkT9zhjrxyr2o0W7B02S/LFyCU0d20sZgpLOnHhTDe+6a8sxpZjhf8EA2MwWLi9SlHH
 qiXqbecRMzsVM=
X-Received: by 2002:ac8:68d:: with SMTP id f13mr8512385qth.300.1615487197413; 
 Thu, 11 Mar 2021 10:26:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykrRpLf1VdnWeXfJOmyNvXTcgKB/EbD8MxyP146EU0lCHJTfc5M6K1GGvBKnS5gI4cz7i4ig==
X-Received: by 2002:ac8:68d:: with SMTP id f13mr8512326qth.300.1615487197076; 
 Thu, 11 Mar 2021 10:26:37 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 77sm2571571qko.48.2021.03.11.10.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 10:26:36 -0800 (PST)
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <f0b90916-9047-d5da-5cde-75d4330cf041@redhat.com>
Date: Thu, 11 Mar 2021 10:26:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Subject: Re: [Linux-stm32] [PATCH v3 00/15] arm64 / clk: socfpga:
 simplifying, cleanups and compile testing
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

Ck9uIDMvMTEvMjEgNzoyNSBBTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBIaSwKPgo+
IEFsbCB0aHJlZSBJbnRlbCBhcm02NCBTb0NGUEdBIGFyY2hpdGVjdHVyZXMgKEFnaWxleCwgTjVY
IGFuZCBTdHJhdGl4IDEwKQo+IGFyZSBiYXNpY2FsbHkgZmxhdm9ycy9wbGF0Zm9ybXMgb2YgdGhl
IHNhbWUgYXJjaGl0ZWN0dXJlLiAgQXQgbGVhc3QgZnJvbQo+IHRoZSBMaW51eCBwb2ludCBvZiB2
aWV3LiAgVXAgdG8gYSBwb2ludCB0aGF0IE41WCBhbmQgQWdpbGV4IHNoYXJlIERUU0kuCj4gSGF2
aW5nIHRocmVlIHRvcC1sZXZlbCBhcmNoaXRlY3R1cmVzIGZvciB0aGUgc2FtZSBvbmUgYmFyZWx5
IG1ha2VzCj4gc2Vuc2UgYW5kIGNvbXBsaWNhdGVzIGRyaXZlciBzZWxlY3Rpb24uCj4KPiBBZGRp
dGlvbmFsbHkgaXQgd2FzIHBvaW50ZWQgb3V0IHRoYXQgQVJDSF9TT0NGUEdBIG5hbWUgaXMgdG9v
IGdlbmVyaWMuCj4gVGhlcmUgYXJlIG90aGVyIHZlbmRvcnMgbWFraW5nIFNvQytGUEdBIGRlc2ln
bnMsIHNvIHRoZSBuYW1lIHNob3VsZCBiZQo+IGNoYW5nZWQgdG8gaGF2ZSByZWFsIHZlbmRvciAo
Y3VycmVudGx5OiBJbnRlbCkuCj4KPgo+IERlcGVuZGVuY2llcyAvIG1lcmdpbmcKPiA9PT09PT09
PT09PT09PT09PT09PT09Cj4gMS4gUGF0Y2ggMSBpcyB1c2VkIGFzIGJhc2UsIHNvIG90aGVyIGNo
YW5nZXMgZGVwZW5kIG9uIGl0cyBodW5rcy4KPiAgICBJIHB1dCBpdCBhdCBiZWdpbm5pbmcgYXMg
aXQgaXMgc29tZXRoaW5nIGNsb3NlIHRvIGEgZml4LCBzbyBjYW5kaWRhdGUKPiAgICBmb3Igc3Rh
YmxlIChldmVuIHRob3VnaCBJIGRpZCBub3QgbWFyayBpdCBsaWtlIHRoYXQpLgo+IDIuIFBhdGNo
IDI6IGV2ZXJ5dGhpbmcgZGVwZW5kcyBvbiBpdC4KPgo+IDMuIDY0LWJpdCBwYXRoOgo+IDNhLiBQ
YXRjaGVzIDMtNzogZGVwZW5kIG9uIHBhdGNoIDIsIGZyb20gNjQtYml0IHBvaW50IG9mIHZpZXcu
Cj4gM2IuIFBhdGNoIDg6IGRlcGVuZHMgb24gMi03IGFzIGl0IGZpbmFsbHkgcmVtb3ZlcyA2NC1i
aXQgQVJDSF9YWFgKPiAgICAgc3ltYm9scy4KPgo+IDQuIDMyLWJpdCBwYXRoOgo+IDRhLiBQYXRj
aGVzIDktMTQ6IGRlcGVuZCBvbiAyLCBmcm9tIDMyLWJpdCBwb2ludCBvZiB2aWV3Lgo+IDRiLiBQ
YXRjaCAxNTogZGVwZW5kcyBvbiA5LTE0IGFzIGl0IGZpbmFsbHkgcmVtb3ZlcyAzMi1iaXQgQVJD
SF9TT0NGUEdBCj4gICAgIHN5bWJvbC4KPgo+IElmIHRoZSBwYXRjaGVzIGxvb2sgZ29vZCwgcHJv
cG9zZWQgbWVyZ2luZyBpcyB2aWEgU29DIHRyZWUgKGFmdGVyCj4gZ2V0dGluZyBhY2tzIGZyb20g
ZXZlcnlvbmUpLiBTaGFyaW5nIGltbXV0YWJsZSBicmFuY2hlcyBpcyBhbHNvIGEgd2F5Lgo+Cj4K
PiBDaGFuZ2VzIHNpbmNlIHYyCj4gPT09PT09PT09PT09PT09PQo+IDEuIFNldmVyYWwgbmV3IHBh
dGNoZXMgYW5kIGNoYW5nZXMuCj4gMi4gUmVuYW1lIEFSQ0hfU09DRlBHQSB0byBBUkNIX0lOVEVM
X1NPQ0ZQR0Egb24gMzItYml0IGFuZCA2NC1iaXQuCj4gMy4gRW5hYmxlIGNvbXBpbGUgdGVzdGlu
ZyBvZiAzMi1iaXQgc29jZnBnYSBjbG9jayBkcml2ZXJzLgo+IDQuIFNwbGl0IGNoYW5nZXMgcGVy
IHN1YnN5c3RlbXMgZm9yIGVhc2llciByZXZpZXcuCj4gNS4gSSBhbHJlYWR5IHJlY2VpdmVkIGFu
IGFjayBmcm9tIExlZSBKb25lcywgYnV0IEkgZGlkIG5vdCBhZGQgaXQgYXMKPiAgICB0aGVyZSB3
YXMgYmlnIHJlZmFjdG9yaW5nLiAgUGxlYXNlIGtpbmRseSBhY2sgb25lIG1vcmUgdGltZSBpZiBp
dAo+ICAgIGxvb2tzIGdvb2QuCj4KPiBDaGFuZ2VzIHNpbmNlIHYxCj4gPT09PT09PT09PT09PT09
PQo+IDEuIE5ldyBwYXRjaCAzOiBhcm02NDogc29jZnBnYTogcmVuYW1lIEFSQ0hfU1RSQVRJWDEw
IHRvIEFSQ0hfU09DRlBHQTY0Lgo+IDIuIE5ldyBwYXRjaCA0OiBhcm02NDogaW50ZWw6IG1lcmdl
IEFnaWxleCBhbmQgTjVYIGludG8gQVJDSF9TT0NGUEdBNjQuCj4gMy4gRml4IGJ1aWxkIGlzLnN1
ZSByZXBvcnRlZCBieSBrZXJuZWwgdGVzdCByb2JvdCAod2l0aCBBUkNIX1NUUkFUSVgxMAo+ICAg
IGFuZCBDT01QSUxFX1RFU1QgYnV0IHdpdGhvdXQgc2VsZWN0aW5nIHNvbWUgb2YgdGhlIGNsb2Nr
cykuCj4KPgo+IFJGVAo+ID09PQo+IEkgdGVzdGVkIGNvbXBpbGUgYnVpbGRzIG9uIGZldyBjb25m
aWd1cmF0aW9ucywgc28gSSBob3BlIGtidWlsZCAwLWRheQo+IHdpbGwgY2hlY2sgbW9yZSBvcHRp
b25zIChwbGVhc2UgZ2l2ZSBpdCBmZXcgZGF5cyBvbiB0aGUgbGlzdHMpLgo+IEkgY29tcGFyZSB0
aGUgZ2VuZXJhdGVkIGF1dG9jb25mLmggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gIFRlc3Rpbmcgb24g
cmVhbAo+IGhhcmR3YXJlIHdvdWxkIGJlIGFwcHJlY2lhdGVkLgo+Cj4gQmVzdCByZWdhcmRzLAo+
IEtyenlzenRvZgo+Cj4gS3J6eXN6dG9mIEtvemxvd3NraSAoMTUpOgo+ICAgY2xrOiBzb2NmcGdh
OiBhbGxvdyBidWlsZGluZyBONVggY2xvY2tzIHdpdGggQVJDSF9ONVgKPiAgIEFSTTogc29jZnBn
YTogaW50cm9kdWNlIGNvbW1vbiBBUkNIX0lOVEVMX1NPQ0ZQR0EKPiAgIG1mZDogYWx0ZXJhOiBt
ZXJnZSBBUkNIX1NPQ0ZQR0EgYW5kIEFSQ0hfU1RSQVRJWDEwCj4gICBuZXQ6IHN0bW1hYzogbWVy
Z2UgQVJDSF9TT0NGUEdBIGFuZCBBUkNIX1NUUkFUSVgxMAo+ICAgY2xrOiBzb2NmcGdhOiBidWls
ZCB0b2dldGhlciBTdHJhdGl4IDEwLCBBZ2lsZXggYW5kIE41WCBjbG9jayBkcml2ZXJzCj4gICBj
bGs6IHNvY2ZwZ2E6IG1lcmdlIEFSQ0hfU09DRlBHQSBhbmQgQVJDSF9TVFJBVElYMTAKPiAgIEVE
QUM6IGFsdGVyYTogbWVyZ2UgQVJDSF9TT0NGUEdBIGFuZCBBUkNIX1NUUkFUSVgxMAo+ICAgYXJt
NjQ6IHNvY2ZwZ2E6IG1lcmdlIEFnaWxleCBhbmQgTjVYIGludG8gQVJDSF9JTlRFTF9TT0NGUEdB
Cj4gICBjbGs6IHNvY2ZwZ2E6IGFsbG93IGNvbXBpbGUgdGVzdGluZyBvZiBTdHJhdGl4IDEwIC8g
QWdpbGV4IGNsb2Nrcwo+ICAgY2xrOiBzb2NmcGdhOiB1c2UgQVJDSF9JTlRFTF9TT0NGUEdBIGFs
c28gZm9yIDMyLWJpdCBBUk0gU29DcyAoYW5kCj4gICAgIGNvbXBpbGUgdGVzdCkKPiAgIGRtYWVu
Z2luZTogc29jZnBnYTogdXNlIEFSQ0hfSU5URUxfU09DRlBHQSBhbHNvIGZvciAzMi1iaXQgQVJN
IFNvQ3MKPiAgIGZwZ2E6IGFsdGVyYTogdXNlIEFSQ0hfSU5URUxfU09DRlBHQSBhbHNvIGZvciAz
Mi1iaXQgQVJNIFNvQ3MKPiAgIGkyYzogYWx0ZXJhOiB1c2UgQVJDSF9JTlRFTF9TT0NGUEdBIGFs
c28gZm9yIDMyLWJpdCBBUk0gU29Dcwo+ICAgcmVzZXQ6IHNvY2ZwZ2E6IHVzZSBBUkNIX0lOVEVM
X1NPQ0ZQR0EgYWxzbyBmb3IgMzItYml0IEFSTSBTb0NzCj4gICBBUk06IHNvY2ZwZ2E6IGRyb3Ag
QVJDSF9TT0NGUEdBCj4KPiAgYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIGFyY2gvYXJtL0tjb25maWcuZGVidWcgICAgICAgICAgICAgICAgICAg
ICAgfCAgNiArKystLS0KPiAgYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgfCAgMiArLQo+ICBhcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZyAgICAgICAg
IHwgIDIgKy0KPiAgYXJjaC9hcm0vY29uZmlncy9zb2NmcGdhX2RlZmNvbmZpZyAgICAgICAgICB8
ICAyICstCj4gIGFyY2gvYXJtL21hY2gtc29jZnBnYS9LY29uZmlnICAgICAgICAgICAgICAgfCAg
NCArKy0tCj4gIGFyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMgICAgICAgICAgICAgICAgfCAx
NyArKysrLS0tLS0tLS0tLS0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsdGVyYS9NYWtlZmls
ZSAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9NYWtlZmlsZSAg
ICAgICAgICB8ICA2ICsrKy0tLQo+ICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAg
ICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvY2xrL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvY2xrL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvY2xrL3NvY2ZwZ2EvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgfCAxOSArKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvY2xrL3NvY2ZwZ2EvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgfCAxMSArKysrKy0tLS0tLQo+ICBkcml2ZXJzL2RtYS9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9lZGFjL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvZWRhYy9hbHRlcmFf
ZWRhYy5jICAgICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKy0tLS0tLQo+ICBkcml2ZXJz
L2Zpcm13YXJlL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9m
cGdhL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKystLS0tCj4gIGRyaXZl
cnMvaTJjL2J1c3Nlcy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJz
L21mZC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnIHwgIDQgKystLQo+ICBkcml2ZXJz
L3Jlc2V0L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIDI0IGZp
bGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc29jZnBnYS9LY29uZmlnCj4KVGhhbmtzIGZvciBjaGFu
Z2luZyB0aGUgY29uZmlnIG5hbWUuCgpQbGVhc2UgcmV2aWV3IGNoZWNrcGF0Y2ggLS1zdHJpY3Qg
b24gdGhpcyBzZXQsIHRoZSB0eXBpY2FsIGNvbXBsYWludCBpcwoKY2xrOiBzb2NmcGdhOiB1c2Ug
QVJDSF9JTlRFTF9TT0NGUEdBIGFsc28gZm9yIDMyLWJpdCBBUk0gU29DcyAoYW5kIGNvbXBpbGUg
dGVzdCnCoMKgwqDCoApXQVJOSU5HOiBwbGVhc2Ugd3JpdGUgYSBwYXJhZ3JhcGggdGhhdCBkZXNj
cmliZXMgdGhlIGNvbmZpZyBzeW1ib2wgZnVsbHkKIzM1OiBGSUxFOiBkcml2ZXJzL2Nsay9zb2Nm
cGcvS2NvbmZpZzoxMTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgCitjb25maWcgQ0xLX0lOVEVMX1NPQ0ZQR0EzMgoKVG9tCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
