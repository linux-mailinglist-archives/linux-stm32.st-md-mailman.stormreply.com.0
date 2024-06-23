Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D42913D9A
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jun 2024 20:58:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EE08C71287;
	Sun, 23 Jun 2024 18:58:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98D20C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 18:58:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 47E1F88271;
 Sun, 23 Jun 2024 20:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719169119;
 bh=n8C7e0ABfIei1PXo0lkdQWQ9ovwX2ZdSBGfBtoz2Of0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IK7meZvgDCVrkUyKdcKeyYtEVeadL20Vur0ju0AHEoVD+qfd52JSIgKku5I9pPtMX
 v6nrF5aRJvqD84RkNxV/xOaZ7/UMSx5DT1/rjZo1I2RG8xO/AtXjWjOMjV0MeFCJUb
 bbwF1OSSJz/pAQYFPdXMMRuQFOZEYf5eFH3ciOue11Gx/oYO3Ok8zskLHg5RrprF/Q
 X9o1EGIpyJOuJUaXLg1y29vh+srDEG6B5zDQ9ZD25R2nUatxsIkC0HxcA7wipm9Beo
 LJUCBSV4DWxoWqKM14mp1zcWRYBybK7woCjI9AOIN2UrSbx+K/gWV7Bjhep4mHnXfO
 +w2wNNszlvfzg==
Message-ID: <f93b5a80-33fb-4708-ab86-6b28f626a186@denx.de>
Date: Sun, 23 Jun 2024 20:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20240415134903.8084-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240415134903.8084-1-marex@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4] watchdog: stm32_iwdg: Add pretimeout
	support
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

T24gNC8xNS8yNCAzOjQ4IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBUaGUgU1RNMzJNUDE1eHgg
SVdERyBhZGRzIHJlZ2lzdGVycyB3aGljaCBwZXJtaXQgdGhpcyBJUCB0byBnZW5lcmF0ZQo+IHBy
ZXRpbWVvdXQgaW50ZXJydXB0LiBUaGlzIGludGVycnVwdCBjYW4gYWxzbyBiZSB1c2VkIHRvIHdh
a2UgdGhlIENQVQo+IGZyb20gc3VzcGVuZC4gSW1wbGVtZW50IHN1cHBvcnQgZm9yIGdlbmVyYXRp
bmcgdGhpcyBpbnRlcnJ1cHQgYW5kIGxldAo+IHVzZXJzcGFjZSBjb25maWd1cmUgdGhlIHByZXRp
bWVvdXQuIEluIGNhc2UgdGhlIHByZXRpbWVvdXQgaXMgbm90Cj4gY29uZmlndXJlZCBieSB1c2Vy
LCBzZXQgcHJldGltZW91dCB0byAzLzQgb2YgdGhlIFdEVCB0aW1lb3V0IGN5Y2xlLgo+IAo+IFJl
dmlld2VkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5j
b20+Cj4gVGVzdGVkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9z
cy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4g
LS0tCj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+
Cj4gQ2M6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiBDYzogTWF4aW1lIENv
cXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBXaW0gVmFuIFNlYnJvZWNr
IDx3aW1AbGludXgtd2F0Y2hkb2cub3JnPgo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQo+IENjOiBsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiBWMjogLSBTdWJ0
cmFjdCB0aGUgcHJldGltZW91dCB2YWx1ZSBmcm9tIHRpbWVvdXQgdmFsdWUgYmVmb3JlIHdyaXRp
bmcgaXQKPiAgICAgICAgaW50byB0aGUgSVdERyBwcmV0aW1lb3V0IHJlZ2lzdGVyLCBiZWNhdXNl
IHRoZSB3YXRjaGRvZyBjb3VudGVyCj4gICAgICAgIHJlZ2lzdGVyIGlzIGNvdW50aW5nIGRvd24s
IGFuZCB0aGUgcHJldGltZW91dCBpbnRlcnJ1cHQgdHJpZ2dlcnMKPiAgICAgICAgd2hlbiB3YXRj
aGRvZyBjb3VudGVyIHJlZ2lzdGVyIG1hdGNoZXMgdGhlIHByZXRpbWVvdXQgcmVnaXN0ZXIKPiAg
ICAgICAgY29udGVudC4KPiAgICAgIC0gU2V0IGRlZmF1bHQgcHJldGltZW91dCB0byAzLzQgb2Yg
dGltZW91dCAuCj4gVjM6IC0gVXNlIGRldiBpbnN0ZWFkIG9mIHBkZXYtPmRldgo+ICAgICAgLSBT
d2FwIG9yZGVyIG9mIHJldC9yZXR1cm4gMAo+ICAgICAgLSBTcGxpdCB0aGlzIGZyb20gdGhlIERU
IGNoYW5nZXMsIHdoaWNoIGFyZSBvcnRob2dvbmFsCj4gICAgICAtIFVoLCB0aGlzIHBhdGNoIGdv
dCBzdHVjayBpbiB1cHN0cmVhbWluZyBxdWV1ZSwgc29ycnkKPiBWNDogLSBVcGRhdGUgY29tbWl0
IG1lc3NhZ2UgdG8gbWF0Y2ggVjIgZGVmYXVsdCBwcmV0aW1lb3V0IHRvIDMvNAo+ICAgICAgLSBB
ZGQgUkIvVEIgZnJvbSBDbMOpbWVudAoKSGksCgpBcmUgdGhlcmUgc3RpbGwgYW55IG9wZW4gdG9w
aWNzIHdpdGggdGhpcyBwYXRjaCA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
