Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KhCGYpv52kK8wEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2026 14:37:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F13F543AB5F
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2026 14:37:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E3F6C8F274;
	Tue, 21 Apr 2026 12:37:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68116C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 12:37:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 04313444BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 12:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC966C2BCB3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776775045;
 bh=ideP4jrO/m036pXeZo7bcsWjA2k3UgxGXAL0J4EOJJQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b2f3wpAgM9QrvFFTlHMpdrImlw7Iplmd1KiU/fQ4R2yhjf+ZmARXrYrCDBaFmScdh
 sk+IibBstdbWBgUJmI4mVtd3H6EZIx16B4A3k9epI6JpWYgTOnujYOi8937zmE6NHF
 mX3Y+FfGdl/IlDVef6ewRYMxjjsel6D3Zx2bcacm+0nJsiEfowPmsXsq1ycE/53MCy
 akU3n/yxpYvz6WB35tcbARG2lm3pqIwHP2ziXyvNZDh2rDlLk3wcZlv2GwlnN2DGy9
 zbgI9Migue8IeZxEk7m0kvutVYVWep2TOoGfFb0DEd9eGqlD00H2QpCBG50GHjF4Bp
 LPghQRR0ACMNg==
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6746d0b2b4aso4227502a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 05:37:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ84XaeNJIfM0tmqYqCDJ4UUp1VPsiPQT8wSO9dBQSxacSr3uQ90GJBctBRx9DETJHMZpK7IUPBs3mF0cg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSTkFSxXHMuRS5rqdGir/OZXc8vej40hTzbco/hpLzDuzf9SaR
 riqM4MJm3gmHvGPh5aWJ6jLg/jirTgEK5oHCiDsrhFDHY26rlUCjPnnOOySPxzwrzR+M2BiA/Nq
 5Fo14Q/Ut4ZWF6MY89aJnAHH9odPIRg==
X-Received: by 2002:a05:6402:e9c:b0:672:523f:1bf4 with SMTP id
 4fb4d7f45d1cf-672bfd999d1mr7012282a12.10.1776775044253; Tue, 21 Apr 2026
 05:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260417024523.107786-1-minda.chen@starfivetech.com>
 <20260417024523.107786-4-minda.chen@starfivetech.com>
 <20260420133930.GA2322456-robh@kernel.org>
 <BJXPR01MB085573DCF307E33E43FD664AE62C2@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <BJXPR01MB085573DCF307E33E43FD664AE62C2@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Apr 2026 07:37:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+PEQ7x_3V2173KHyffzY7CzLoYoFDNvTpdn2-Q_eKR-A@mail.gmail.com>
X-Gm-Features: AQROBzB2M3mNV2WntzVbuyGm-8OM0dCyGRaPWNfGo4jCW3v3OLTBz32FUX-FwZE
Message-ID: <CAL_Jsq+PEQ7x_3V2173KHyffzY7CzLoYoFDNvTpdn2-Q_eKR-A@mail.gmail.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley <conor@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v2 3/5] dt-bindings: net: starfive,
 jh7110-dwmac: Add JHB100 sgmii rx clk
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
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:minda.chen@starfivetech.com,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,kernel.org,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	ARC_NA(0.00)[];
	NEURAL_SPAM(0.00)[0.947];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: F13F543AB5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBBcHIgMjAsIDIwMjYgYXQgMTA6MznigK9QTSBNaW5kYSBDaGVuIDxtaW5kYS5jaGVu
QHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4KPgo+Cj4gPgo+ID4gT24gRnJpLCBBcHIgMTcs
IDIwMjYgYXQgMTA6NDU6MjFBTSArMDgwMCwgTWluZGEgQ2hlbiB3cm90ZToKPiA+ID4gSkhCMTAw
IFNHTUlJIGludGVyZmFjZSB0eC9yeCBtYWMgY2xvY2sgaXMgc3BsaXQgYW5kIHJlcXVpcmUgdG8g
c2V0Cj4gPiA+IGNsb2NrIHJhdGUgaW4gMTBNLzEwME0vMTAwME0gc3BlZWQuIFNvIGR0cyBuZWVk
IHRvIGFkZCBhIG5ldyByeCBjbG9jawo+ID4gPiBpbiBjb2RlLCBkdHMgYW5kIGR0IGJpbmRpbmcg
ZG9jLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaW5kYSBDaGVuIDxtaW5kYS5jaGVuQHN0
YXJmaXZldGVjaC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2JpbmRpbmdzL25ldC9zdGFyZml2
ZSxqaDcxMTAtZHdtYWMueWFtbCAgIHwgNDIgKysrKysrKysrKysrKysrKy0tLQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQKPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L3N0YXJmaXZlLGpoNzExMC1kd21hYy55YW1sCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC9zdGFyZml2ZSxqaDcxMTAtZHdtYWMueWFtbAo+ID4gPiBpbmRleCBl
ZGMyNDZhNzFjZTMuLjM4MDJjZGJmMTg0OCAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zdGFyZml2ZSxqaDcxMTAtZHdtYWMueWFtbAo+ID4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0YXJmaXZlLGpo
NzExMC1kd21hYy55YW1sCj4gPiA+IEBAIC0zOSwyMCArMzksMjYgQEAgcHJvcGVydGllczoKPiA+
ID4gICAgICBtYXhJdGVtczogMQo+ID4gPgo+ID4gPiAgICBjbG9ja3M6Cj4gPiA+ICsgICAgbWlu
SXRlbXM6IDUKPiA+ID4gICAgICBpdGVtczoKPiA+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IEdN
QUMgbWFpbiBjbG9jawo+ID4gPiAgICAgICAgLSBkZXNjcmlwdGlvbjogR01BQyBBSEIgY2xvY2sK
PiA+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IFBUUCBjbG9jawo+ID4gPiAgICAgICAgLSBkZXNj
cmlwdGlvbjogVFggY2xvY2sKPiA+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IEdUWCBjbG9jawo+
ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogU0dNSUkgUlggY2xvY2sKPiA+ID4KPiA+ID4gICAg
Y2xvY2stbmFtZXM6Cj4gPiA+IC0gICAgaXRlbXM6Cj4gPiA+IC0gICAgICAtIGNvbnN0OiBzdG1t
YWNldGgKPiA+ID4gLSAgICAgIC0gY29uc3Q6IHBjbGsKPiA+ID4gLSAgICAgIC0gY29uc3Q6IHB0
cF9yZWYKPiA+ID4gLSAgICAgIC0gY29uc3Q6IHR4Cj4gPiA+IC0gICAgICAtIGNvbnN0OiBndHgK
PiA+ID4gKyAgICBtaW5JdGVtczogNQo+ID4gPiArICAgIG1heEl0ZW1zOiA2Cj4gPiA+ICsgICAg
Y29udGFpbnM6Cj4gPiA+ICsgICAgICBlbnVtOgo+ID4gPiArICAgICAgIC0gc3RtbWFjZXRoCj4g
PiA+ICsgICAgICAgLSBwY2xrCj4gPiA+ICsgICAgICAgLSBwdHBfcmVmCj4gPiA+ICsgICAgICAg
LSB0eAo+ID4gPiArICAgICAgIC0gZ3R4Cj4gPiA+ICsgICAgICAgLSBzZ21paV9yeAo+ID4KPiA+
IE5vLCB0aGlzIGFsbG93cyBhbnkgb2YgdGhlIGFib3ZlIHN0cmluZ3MgcGx1cyBhbnkgb3RoZXIg
cmFuZG9tIHN0cmluZ3MuCj4gPgo+ID4gUm9iCj4KPiBHb3QgaXQuIFRoYW5rcy4gSW4gSkhCMTAw
IEkgd2lsbCB1c2luZyAib25lT2YiIDUgY2xvY2tzIG9yIDYgY2xvY2tzLiA3MTAwLzcxMDAgYXJl
IGNvbnN0IGNsb2NrIG5hbWVzCgpObywgYmFzZWQgb24gd2hhdCB5b3UgZGlkIGZvciAnY2xvY2tz
JywgeW91IGp1c3QgbmVlZDoKCiAgY2xvY2stbmFtZXM6CiAgICBtaW5JdGVtczogNQogICBpdGVt
czoKICAgICAgLSBjb25zdDogc3RtbWFjZXRoCiAgICAgIC0gY29uc3Q6IHBjbGsKICAgICAgLSBj
b25zdDogcHRwX3JlZgogICAgICAtIGNvbnN0OiB0eAogICAgICAtIGNvbnN0OiBndHgKICAgICAg
LSBzZ21paV9yeAoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
