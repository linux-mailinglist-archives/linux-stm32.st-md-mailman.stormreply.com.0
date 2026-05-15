Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGBVG8owB2oQswIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2026 16:42:18 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F95519B2
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2026 16:42:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E64BAC87EDB;
	Fri, 15 May 2026 14:42:16 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2BADC87ECB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 14:42:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48e56c1bf5dso54192525e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778856134; x=1779460934;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7DLL66al4CZld43bSNXSjcwgynvaL5lE06OXkqyj12I=;
 b=QdLfx5L+8ovj9OiORDvIhyorMPN41S1szs1HRXiv40mSD868nEyVDetmBd+J4CBFEY
 MlSvySuKYWUCP9tWJ2pUfGlJMh4aXPhgDHsoHdNSvIOrdwr06VX2ueZhp/g4zSLv+q3u
 p5/BidLkRW3rZWaY51Ha2fyOwhCs3L0azddJsOAtn4f965ZPOgCf0o8vRr6+K12Son1q
 9BELsT+JRmG2TsUni6vQH7vfzWBIoHWZQWigNvuzB5KLLzqoK6h+Wo23ORC5zOly0NLQ
 fXXErh8cPKf8tGF6vGLrJgklxUZS3gdWyFjgXg/91faEzFF+z+UMXWQ+AvhWjLN6zUmD
 UMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778856134; x=1779460934;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7DLL66al4CZld43bSNXSjcwgynvaL5lE06OXkqyj12I=;
 b=ZK8WjxuU3RKbhKqW5+/NYv3Q4t1b7DjoaQ+P8VvBwRgfcxnlIE1to4f5rBn6SdECMf
 XZ7SWckaJaPr8LeNrDCEQpQitMRP97QHd+XZe9/BoTTL/kQ2wjnDA47/ST3LUsMZg4f0
 PsSAe4cCoP0fI2wtWAjUFAiOXesA250CwDfPFwH25YOUm7WjzYovfui3Mh7/fvrFQ52n
 ECzG972evNVkWWk9F7jB9xuoAkKBK7ALldKMyoQsR3HG3Jhkdr7Wn6UUfquG7G3YWOBk
 L79U3FeU2UDiBAzXI8IjYEwUK06Pg7/bjrMcVj4IonZwAeZcwluG67ASZGYoQt9JOVFa
 EZMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/vcCCuuXhU82IHnRcHzvGZSg0Zw6NijfR3SZoaNGBYeRwwE+O3CijpJbXC6YrGimTj5qsBAR2MSCjESQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzCuQ7327I+m70CniB+ZCdgsSgXz7hbJ0VGUaCbnhTQMIVhVfm1
 D+5SIOzAThG/eJz88fRc1flz+LqWMW3lvXSCFbiQeWKuHViLkJvtRXc/fB6DLEsImlA=
X-Gm-Gg: Acq92OGq20QjhAryVpZWtO4uOhgDmc/swksXITI1z3EYUuwLJfiIo+JtfP4sm30iFjW
 eSG/dDI0JZra4FP8QSY57ez+fH1snPPYBSh86IBauSajhb4qoq2QwA4Am7Hm1cZ3T+3gs8Klo3L
 vSZIaXadLB03QG9/lq7wyOPxDABEkTHsr5Dj+3zQqGNrIIX5nxTXp1PL+Rs4JmbaR3Fij3O+1Tx
 E3JXK5zdzb8+DQdJoL2qCuG7/C6s7piuiqUGdW63UWz23W33cpD1MN9Atif5i49H0Zomel1JV3z
 tA0MOQDCz9F6DjOQ7RowOjeno/gwliFSLHG5JGpDS1INRGhthn1zxw07q0iTIL3s5wrkvqXlihh
 nsZfoqwFhLDaw7rtT/Bt7Kz/sQMYaCcBDAXKfzF58iDgK1KgRppVYV1AeEMWwQqpGCeFCKXZ7bE
 4daN2cnKZS78HLK7gJ3VJN5GQSlO+P++Jmghk7Gbymc4+bEkV2Pf7B5kbCb0qTIoAxxd2FYtfz+
 0PNPqiJ0+T9BFT0m94atUUBicb88hd0d57pwpBHV0mujqjj9jCsIp6m1unQ9zCMsPoXQG+51hyZ
 pu5Wn2eiUPUO2Q4CPZ8=
X-Received: by 2002:a05:600c:8485:b0:486:fa35:aef2 with SMTP id
 5b1f17b1804b1-48fe5fcdec2mr67166485e9.4.1778856133590; 
 Fri, 15 May 2026 07:42:13 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febf80d04sm14872875e9.36.2026.05.15.07.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:42:12 -0700 (PDT)
Date: Fri, 15 May 2026 15:42:09 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <agcwwRhXqKljob0m@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
 <agRzai1UoHEIotZe@aspen.lan>
 <3c6e7ec5-f600-44ee-a97a-211a99102744@lunn.ch>
 <agXo_evi1oFLBJoo@aspen.lan>
 <f113752b-b351-4a14-af6d-1e2751f0913d@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f113752b-b351-4a14-af6d-1e2751f0913d@lunn.ch>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 Alex Elder <elder@riscstar.com>, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, gregkh@linuxfoundation.org,
 andersson@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, linusw@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 12/12] arm64: dts: qcom:
 qcs6490-rb3gen2: enable TC9564 with a single QCS8081 phy
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
X-Rspamd-Queue-Id: C45F95519B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.qualcomm.com,m:gregkh@linuxfoundation.org,
 m:andersson@kernel.org,m:a0987203069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:linusw@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.184];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMDY6MTQ6MDdQTSArMDIwMCwgQW5kcmV3IEx1bm4gd3Jv
dGU6Cj4gPiBJ4oCZbSBhZnJhaWQgdGhpcyBtdXN0IGJlIG5lY2Vzc2FyaWx5IGxvbmcgYnV0IHRv
IGhlbHAgbmF2aWdhdGUgdGhlCj4gPiBnZW5lcmFsIHN0cnVjdHVyZSBpczoKPgo+IFRoYW5rcyBm
b3IgdGhlIGxvbmcgZW1haWwuCj4KPiA+IExldOKAmXMgdHVybiBvdXIgYXR0ZW50aW9uIHRvIE1E
SU8uCj4gPgo+ID4gRm9sbG93aW5nIHRoZSBwYXR0ZXJuIGFib3ZlIHdoZXJlIGFsbCB0aGUgbGlu
a3MgcmVsYXRlZCB0byBwb3dlciBjb21lCj4gPiBmcm9tIHRoZSBtYWluIGRldmljZSBub2RlLCB0
aGVuIHRoZSBwaHkgbm9kZSBmb3IgdGhlIHFjYTgwODEgaW4gYW4KPiA+IHJiM2dlbjIgd291bGQg
bG9vayBsaWtlIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gPgo+ID4gICAgIHRjOTU2eF9lbWFjMV9w
aHk6IGV0aGVybmV0LXBoeUAxYyB7Cj4gPiAgICAgICAgIGNvbXBhdGlibGUgPSAiZXRoZXJuZXQt
cGh5LWlkMDA0ZC5kMTAxIjsKPiA+ICAgICAgICAgcmVnID0gPDB4MWM+Owo+ID4KPiA+ICAgICAg
ICAgcmVzZXQtZ3Bpb3MgPSA8JnRjOTU2eF9lbWFjMCAxIEdQSU9fQUNUSVZFX0xPVz47Cj4gPiAg
ICAgICAgICMgT24gUkIzZ2VuMiBhbGwgc3VwcGxpZXMgYXJlIGNvbnRyb2xsZWQgYnkgYSBzaW5n
bGUgR1BJTwo+ID4gICAgICAgICAjIHNvIHdlIGxpbmsgYWxsIHN1cHBsaWVzIHRvIHRoYXQgc2lu
Z2xlIHJlZ3VsYXRvcgo+ID4gICAgICAgICBhdmRkLXN1cHBseSA9IDwmcWVwXzFwOD47Cj4gPiAg
ICAgICAgIGF2ZGQxOC1zdXBwbHkgPSA8JnFlcF8xcDg+Owo+ID4gICAgICAgICB2ZGQtc3VwcGx5
ID0gPCZxZXBfMXA4PjsKPiA+ICAgICAgICAgdmRkbGRvLXN1cHBseSA9IDwmcWVwXzFwOD47Cj4g
PiAgICAgICAgIHZkZDE4LXN1cHBseSA9IDwmcWVwXzFwOD47Cj4gPiAgICAgICAgIHZkZDEyNS1z
dXBwbHkgPSA8JnFlcF8xcDg+Owo+ID4KPiA+ICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsKPiA+ICAgICAgICAgcGluY3RybC0wID0gPCZxZXBfaXJxX3Bpbj47Cj4gPiAgICAgICAg
IGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JnRsbW0gMTAxIElSUV9UWVBFX0xFVkVMX0xPVz47Cj4g
PiAgICAgfTsKCkkgbmVhcmx5IHNuaXBwZWQgdGhpcy4uLiBidXQgSSByZWZlcnJpbmcgdG8gKi1z
dXBwbGllcyBzbyBvZnRlbiBiZWxvdwpJIGRlY2lkZWQgaXQgd2FzIHVzZWZ1bCB0byBrZWVwIGl0
IQoKCj4gPiBPbmNlIHdlIGhhdmUgZXN0YWJsaXNoZWQgd2hhdCB0aGUgRFQgbG9va3MgbGlrZSB0
aGVuIHRoZSBxdWVzdGlvbgo+ID4gYmVjb21lcyB3aGVyZSB0byBwdXQgInNvbWV0aGluZywgd3Jp
dHRlbiBpbiBDIFtvciBSdXN0XSwgdGhhdCBjb250YWlucwo+ID4gYnVybmVkIGluIGtub3dsZWRn
ZSBvZiBob3cgdG8gdHVybiBvbiBhIHdjbjY4NTVeSF5IXkheSF5IXkheSHFjYTgwODEiPwo+ID4K
PiA+IFRoZSBxY2E4MDgxIG9uIHJiM2dlbjIganVzdCBnZXRzIGEgYnVuY2ggb2YgaW5kaXZpZHVh
bCByZWd1bGF0b3JzIGFuZCBhCj4gPiByZXNldC4gQXMgaW4gdGhlIHBjaS1wd3JjdHJsLXRjOTU2
MyBleGFtcGxlIGFib3ZlLCB0aGlzIG1lYW5zIHRoZXJlIGlzCj4gPiBub3RoaW5nIGluIHRoZSBE
VCBmb3IgYSBwd3JzZXEgZHJpdmVyIHRvIGJpbmQgdG8uCj4KPiBJIGRvbid0IHVuZGVyc3RhbmQg
dGhhdC4gV2UgaGF2ZSBhIG5vZGUgaW4gZGV2aWNlIHRyZWUgZm9yIHRoZSBQSFkuIFdlCj4gY2Fu
IHB1dCB0aGUgbmVlZGVkIHByb3BlcnRpZXMgdGhlcmUgc29tZWhvdy4gIE1heWJlIHNpbWlsYXIg
dG8gaG93Cj4gcGluY3RybCB3b3Jrcy4gQmVmb3JlIHByb2JpbmcgdGhlIGRldmljZSwgdGhlIGRy
aXZlciBjb3JlIGxvb2tzIGZvcgo+IHRoZSBwaW5jdHJsLSBwcm9wZXJ0aWVzLCBhbmQgYWN0aXZh
dGVzIHRoZW0uIFdlIGNvdWxkIGhhdmUgc2ltaWxhcgo+IHByb3BlcnRpZXMgZm9yIHBvd2VyIHNl
cXVlbmNpbmcsIGJlZm9yZSBlbnVtZXJhdGluZyBhbiBhZGRyZXNzLCBkbwo+IHdoYXRldmVyIHRo
ZSBwd3JzZXEtbmFtZXMgcmVxdWVzdHM/IEl0IG1pZ2h0IG5lZWQgaGVscCBmb3IgdGhlIGRyaXZl
cgo+IGFjdHVhbGx5IGVudW1lcmF0aW5nIHRoZSBidXMsIHRvIHBvaW50IHRvIGNvcmUgYXQgdGhl
IG5vZGUuCgpwaW5jdHJsIHByb3BlcnRpZXMgZGVzY3JpYmUgdGhlIHJlbGF0aW9uc2hpcCBiZXR3
ZWVuIHRoZSBkZXZpY2UgYW5kIHRoZQpwaW4gY29udHJvbGxlciBvZiBpdHMgaG9zdC4gSW4gdGhl
IGNhc2UgYWJvdmUgJnFlcF9pcnFfcGluIGl0IGxlYWRzIGJhY2sKdG8gc29tZXRoaW5nIGJlbG9u
Z2luZyB0byB0aGUgcGluIGNvbnRyb2xsZXIuCgpEZXZpY2V0cmVlIGRvZXMgaGF2ZSBwb3dlciBk
b21haW5zIGFuZCB0aGVzZSBhcmUgYWN0dWFsbHkgcHJldHR5IHNpbWlsYXIKdG8gcGluY3RybC4g
cG93ZXItZG9tYWlucyBwcm9wZXJ0aWVzIGFyZSB1c2VkIHRvIGVzc2VudGlhbGx5IHVzZWQgdG8K
ZGVzY3JpYmUgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZSBkZXZpY2UgYW5kIGEgcG93ZXIg
ZG9tYWluCmNvbnRyb2xsZXIuCgpIb3dldmVyIGluIHRoaXMgY2FzZSBwb3dlciBkb21haW5zIGRv
bid0IHJlYWxseSBmaXQuIFRoZXJlIGlzIG5vIHBvd2VyCmRvbWFpbiBjb250cm9sbGVyIHRvIGxp
bmsgdG8uIFRodXMgSSdkIHN0aWxsIGV4cGVjdCB0aGUgcGh5IHBvd2VyCnN1cHBsaWVzIHRvIGJl
IG1vZGVsbGVkIGluIGRldmljZXRyZWUgYXMgSSBzaG93ZWQgYWJvdmUuICBwd3JzZXEsIFBDSQph
bmQgVVNCIGFsbCBhZG9wdCB0aGlzIGFwcHJvYWNoIGZvciBtb2RlbGxpbmcgb25ib2FyZCBkZXZp
Y2VzIGluIERULgoKCj4gPiBFdmVuIGlmIHdlIGNvdWxkIGZpbmQKPiA+IGEgd2F5IHRvIGRvIHRo
YXQsIGl0IGlzIG5vdCBvYnZpb3VzbHkgdXNlZnVsIHRvIGRlY291cGxlIGhvdyB0byB0dXJuIG9u
Cj4gPiBhbiBNRElPIGRldmljZSBmcm9tIGhvdyB0byBkcml2ZSBpdC4gVGh1cyBJIHRoaW5rIHRo
ZSByaWdodCBhbnN3ZXIgdG8KPiA+IHRoYXQgaXMgdG8gcHV0IHRoZSBjb2RlIHRvIGZpcmUgdXAg
dGhlIHJlZ3VsYXRvcnMgaW50byB0aGUgcWNhODA4eC5jCj4gPiBkcml2ZXIgYW5kIGl0IGxvb2tz
IHRvIG1lIGxpa2UgdGhlIGV4aXN0aW5nIHByb2JlL3JlbW92ZSBtZXRob2RzIHdvdWxkCj4gPiBh
bHJlYWR5IHdvcmsgcGVyZmVjdGx5IHdlbGwgYXMgdGhlIHBsYWNlIHRvIHB1dCBpdC4KPgo+IEJ1
dCB5b3UgaGF2ZSBhIGNoaWNrZW4vZWdnLiBTYW1lIGFzIHdpdGggUENJLCB3aXRoIEV0aGVybmV0
IFBIWXMsIHlvdQo+IGFzayB0aGUgZGV2aWNlIHdoYXQgaXQgaXMsIGFuZCB0aGVuIGZpbmQgYSBk
cml2ZXIgdG8gZHJpdmUgaXQsIGFuZAo+IHRoZW4gY2FsbCB0aGUgcHJvYmUgZnVuY3Rpb24uIEhv
d2V2ZXIsIGlmIGl0cyBjbG9jayBpcyBvZmYsIGl0cyBHUElPCj4gcmVzZXQgaXMgaGVsZCBpbiBy
ZXNldCwgaXRzIHBvd2VyIHJlZ3VsYXRvcnMgYXJlIHN3aXRjaCBvZmYsIGl0IG5ldmVyCj4gYW5z
d2VycyB3aGVuIHlvdSBhc2sgaXQsIHdoYXQgYXJlIHlvdT8gSWYgeW91IGhhdmUgbm8gaWRlYSB3
aGF0IGl0IGlzLAo+IHlvdSBjYW5ub3QgcHJvYmUgaXQuIEFuZCBpZiB5b3UgY2Fubm90IHByb2Jl
IGl0LCB0aGUgcHJvYmUgZnVuY3Rpb24KPiBjYW5ub3QgdHVybiBhbGwgdGhlc2UgdGhpbmdzIG9u
Lgo+Cj4gVGhlIHN0YW5kYXJkIHJlcGx5IHdlIGhhdmUgaXMsIGlnbm9yZSB0aGUgZmFjdCB0aGUg
ZGV2aWNlIGNhbiBiZQo+IGVudW1lcmF0ZWQsIGhhcmQgY29kZSBpbiBEVCB3aGF0IGl0cyBJRCBp
cy4gQW5kIHRoYXQgaXMgd2hhdCB5b3UgaGF2ZQo+IGFib3ZlIGluIHlvdXIgRFQgZnJhZ21lbnQu
CgpNeSBjb21tZW50IGFib3ZlIGFib3V0IGl0IG5vdCBiZWluZyB1c2VmdWwgdG8gZGVjb3VwbGUg
d2FzIHZlcnkgbXVjaApiYXNlZCBvbiB0aGlzICJzdGFuZGFyZCByZXBseSIuCgpUaGUgKi1zdXBw
bHkgcHJvcGVydGllcyB3aWxsIGRpZmZlciBmcm9tIHBoeSB0byBwaHkgc28gd2UgbmVlZCB0aGUg
RFQKdG8ga25vdyB3aGF0IGRldmljZSBpcyBpbiBvcmRlciB0byBzdXBwbHkgdGhlIHJpZ2h0IHBy
b3BlcnRpZXMuIEluIG90aGVyCndvcmRzIGRlLWNvdXBsaW5nIHRoZSBwYXJzaW5nIG9mIHRob3Nl
IHN1cHBseSBwcm9wZXJ0aWVzIChhbmQgYW55dGhpbmcKZWxzZSkgZG9lcyBub3QgaGVscCBNRElP
IHdpdGggdGhlIGNoaWNrZW4vZWdnIHByb2JsZW0uCgpIb3dldmVyIHBlcmhhcHMgSSB3YXMgYmVp
bmcgYSBsaXR0bGUgc2hvcnRzaWdodGVkIHRvIHNheSB0aGVyZSBhcmUgbm8KYmVuZWZpdHMgKGJl
bG93KS4KCgo+IEJ1dCB5b3UgYWxzbyBuZWVkIHRvIGxpdmUgd2l0aCB0aGUKPiBjb25zZXF1ZW5j
ZXMgb2YgaXQgYmVpbmcgd3JvbmcsIHNpbmNlIHRoYXQgZHJpdmVyIGlzIGdvaW5nIHRvIGJlCj4g
bG9hZGVkLCBubyBxdWVzdGlvbnMgYXNrZWQuIEFuZCBkb24ndCB0aGluayBhYm91dCBoYXZpbmcg
YSByZXYgQSBib2FyZAo+IGFuZCBhIHJldiBCIGJvYXJkIHdoaWNoIGhhdmUgZGlmZmVyZW50IHBp
biBjb21wYXRpYmxlIFBIWXMsIGFuZCB3YW50Cj4gdG8gdXNlIHRoZSBlbnVtZXJhdGlvbiB0byBn
ZXQgdGhlIGNvcnJlY3QgZHJpdmVyIGxvYWRlZC4KClR5cGljYWxseSBlbWJlZGRlZCBwbGF0Zm9y
bXMgInNvbHZlIiB0aGlzIGJ5IGhhdmluZyBhIGJvb3Rsb2FkZXIKcmV0cmlldmUgdGhlIGJvYXJk
IHJldmlzaW9uICh1c3VhbGx5IGZyb20gd2hhdGV2ZXIgbm9uLXZvbGF0aWxlIHN0b3JhZ2UKaXQg
a2VlcHMgdGhlIG1hYyBhZGRyZXNzKSBhbmQgc3dhcCBhIHN0YXR1cyA9ICJva2F5Ii9zdGF0dXMg
PQoiZGlzYWJsZWQiIHBhaXIgaW4gdGhlIERULgoKVGhpcyBpcyBub3QgZ3JlYXQgKGhlbmNlIHF1
b3RpbmcgInNvbHZlIikgYnV0IGl0IG11c3QgYWxzbyBiZSBhZGRlZAp0aGF0IHRoaXMgYXBwcm9h
Y2ggZG9lcyBhbHNvIHdvcmsgd2hlbiB0aGUgUEhZIGlzbid0IHBpbiBjb21wYXRpYmxlIGFuZApu
ZWVkcyB0byBiZSBwb3dlcmVkIHVwIGRpZmZlcmVudGx5LgoKCj4gRFQgZGV2ZWxvcGVycyBjb250
aW51YWxseSB3YW50IHRvIG1ha2UgdXNlIG9mIHRoZSBlbnVtZXJhdGlvbiBmZWF0dXJlLAo+IHNp
bmNlIGl0IGlzIHRoZXJlLCBwYXJ0IG9mIDgwMi4zLCBpdCBpcyBob3cgaXQgd2FzIGRvbmUgZm9y
IHRoZSBmaXJzdAo+IDIwIHllYXJzIG9mIG5ldHdvcmtpbmcsIGV0Yy4gQW5kIHRoZXkga2VlcCB0
cnlpbmcgdG8gZXh0ZW5kIHRoZQo+IGN1cnJlbnQgY29kZSB0byBnZXQgdGhlIFBIWSBydW5uaW5n
IHRvIGFsbG93IGl0IHRvIGJlIGVudW1lcmF0ZWQuICBBbmQKPiBpIGtlZXAgcmVqZWN0aW5nIGl0
LgoKSGFzIHNvbWVvbmUgYWxyZWFkeSB0cmllZCB0byAic2VsbCIgeW91IG9uIGFwcHJvYWNoIHNv
bWV3aGF0IHNpbWlsYXIgdG8KdGhlIG9uYm9hcmRfdXNiX2RldiBjb2RlPwoKb25ib2FyZF91c2Jf
ZGV2IGNlbnRyYWxpemVzICphbGwqIGtub3dsZWRnZSBvZiBob3cgdG8gdHVybiB0aGUgcmVndWxh
dG9ycywKY2xvY2tzLCByZXNldHMgZm9yIGFsbCBzb2xkZXJlZCBkb3duIFVTQiBkZXZpY2VzIHRo
YXQgbmVlZCBoZWxwIHRvIGJlCnR1cm5lZCBvbi4gSW4gdGhlIGNhc2Ugb2YgVVNCIHRoZW4gaXQg
bGl0ZXJhbGx5IGV4YW1pbmVzIHRoZSBsaXN0IG9mClZJRC9QSUQgcGFpcnMgc3VwcG9ydGVkIGJ5
IG9uYm9hcmRfdXNiX2RldiB0byBkZWNpZGUgd2hldGhlciB0byBjcmVhdGUKdGhlIHBsYXRmb3Jt
IGRldmljZSB1c2VkIHRvIGx1YnJpY2F0ZSB0aGluZ3MuCgpUaGlzIHN0aWxsIHJlbGllcyBvbiB0
aGUgInN0YW5kYXJkIHJlcGx5IiBtZWFuaW5nIGl0IGRvZXNuJ3Qgc29sdmUgdGhlCmNoaWNrZW4v
ZWdnIGFuZCBpdCBkb2Vzbid0IGF2b2lkIHRoZXJlIGJlaW5nIHNvbWV0aGluZyB3cml0dGVuIGlu
IEMgKG9yClJ1c3QpIHRoYXQga25vd3MgaG93IHRvIHR1cm4gb24gZGV2aWNlcy4gSG93ZXZlciBp
dCBkb2VzIGRvIGlzIG1vdmUKdGhlIGNodXJuIGFzc29jaWF0ZWQgd2l0aCBlbmFibGluZyBhIG5l
dyBVU0Igb24gYW4gZW1iZWRkZWQgcGxhdGZvcm0Kb3V0IG9mIHRoZSBVU0IgZHJpdmVycyBhbmQg
aW50byBhIHNpbmdsZSBjZW50cmFsaXplZCBwbGFjZS4KCldpdGggdGhlIGVtYmVkZGVkIGNodXJu
IG9uIG9uZSBwbGFjZSBzdG9wcyAiZW1iZWRkZWQgY3JhcCIgZnJvbSBjcmVlcGluZwp0aHJvdWdo
IHRoZSBhbGwgdGhlIGRyaXZlcnMuIEkgc3VzcGVjdCBpcyBhbHNvIG11Y2ggZWFzaWVyIHRvIGRp
dmlkZQpyZXZpZXcvbWFpbnRlbmFuY2UgcmVzcG9uc2liaWxpdGllcy4KCkZXSVcgSSB0aGluayB0
aGUgcmVsYXRpdmVseSBzaW1wbGUgc3RydWN0dXJlIG9mIHRoZSBNRElPIGJ1cyBtZWFucyB3ZQpk
b24ndCBhY3R1YWxseSBoYXZlIHRvIG1lc3MgYWJvdXQgd2l0aCBwbGF0Zm9ybSBkZXZpY2VzLiBJ
IHRoaW5rIG9uZQptaWdodCBiZSBhYmxlIHRvIGdldCBpdCBkb3duIHRvIGZvdXIgZnVuY3Rpb24g
Y2FsbHMgKHdoaWNoIGNvdWxkIGVhc2lseQpiZSBzdHViYmVkIG91dCBvbiAhQ09ORklHX09GIHN5
c3RlbXMpLgoKCj4gSWRlYWxseSwgaSB3b3VsZCBsaWtlIHNvbWUgZ2VuZXJpYyBjb3JlIGNvZGUg
d2hpY2ggY2FuIGJlIGdpdmVuIGEgbGlzdAo+IG9mIHJlc291cmNlcywgcHJvYmFibHkgcGhhbmRs
ZXMsIGFuZCB0aW1pbmcgaW5mb3JtYXRpb24uIEFuZCBpdCB3aWxsCj4gd2FsayB0aGUgbGlzdCBh
bmQgdHVybiB0aGVtIG9uLCBpbnNlcnRpbmcgdGhlIHJlcXVlc3RlZCBkZWxheXMuIEFuZAo+IHRo
ZW4gd2UgY2FuIGVudW1lcmF0ZSB0aGUgZGV2aWNlLgo+Cj4gVW50aWwgc3VjaCBjb2RlIGV4aXN0
cywgaSBhZ3JlZSwgZm9yZ2V0IHRoZSBkZXZpY2UgaXMgZW51bWVyYWJsZSwgaGFyZAo+IGNvZGUg
dGhlIElELCBhbmQgZ2V0IHRoZSBwcm9iZSBmdW5jdGlvbiB0byBlbmFibGUgdGhlIHJlZ3VsYXRv
cnMsIHRha2UKPiB0aGUgZGV2aWNlIG91dCBvZiByZXNldCwgZW5hYmxlIHRoZSBjbG9ja3MsIGV0
Yy4gQW5kIHJlcGVhdCB0aGF0IGluCj4gZXZlcnkgUEhZIGRyaXZlci4KClNvLCBoYXZpbmcgc3Bl
bnQgYSBiaXQgb2YgdGltZSB0aGlua2luZyBhYm91dCBpdCBJIGRvIHdvbmRlciBpZiBjcmVhdGlu
Zwpzb21lIGtpbmQgb2Ygb25ib2FyZF9tZGlvLmMgdG8gY29sbGVjdCBrbm93bGVkZ2Ugb2YgaG93
IHRvIHR1cm4gc3BlY2lmaWMKbWRpbyBkZXZpY2VzIG9uIG1pZ2h0IGJlIGJldHRlciB0aGFuIHB1
dHRpbmcgdGhlIHNhbWUga25vd2xlZGdlCmRpcmVjdGx5IGludG8gcHJvYmUgZnVuY3Rpb25zLgoK
U2hvdWxkIGdlbmVyaWMgY29yZSBjb2RlIChvciBsaWJyYXJ5IGZ1bmN0b25zKSBldmVyIGFycml2
ZSB0aGVuIGhhdmluZwp0aGlzIGNvZGUgY2VudHJhbGl6ZWQgYmV0d2VlbiBwaHlzIHdvdWxkIG1h
a2UgYWRvcHRpbmcgdGhlIGdlbmVyaWMgY29kZQpjb2RlIGVhc2llci4KCkknbSBub3Qgb3Zlcmx5
IGF0dGFjaGVkIHRvIGVpdGhlciBpZGVhIGJ1dCBpZiB5b3UnZCBsaWtlIG1lIHRvIHNrZXRjaApv
dXQgYSBwcm90b3R5cGUgdGhlbiBsZXQgbWUga25vdyEKCgpEYW5pZWwuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
