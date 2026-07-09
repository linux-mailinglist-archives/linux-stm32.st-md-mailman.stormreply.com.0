Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2wRiN5BFT2oodQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 08:54:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B81A72D606
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 08:54:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="eve+Ku/b";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E313CC8F284;
	Thu,  9 Jul 2026 06:54:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 112F0C7A832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 06:54:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CA9D86001A;
 Thu,  9 Jul 2026 06:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA18F1F000E9;
 Thu,  9 Jul 2026 06:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783580044;
 bh=Umjxh1wdEigWfrDYfCtSPiAZ4y/Nii4EbVro+PImADI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=eve+Ku/buy7nr9gkUgllmP30UOO+QyApAmLGK6h4Qn42Nr4HNLucG+pYmO07Wtxmk
 DWtBcDkCybkjMlqjaJAwd+FunPhP/l5E8qcTL2xsPlkrRQwgTqcC58b15eC4WZCrNW
 fy+PA4ct/pREL/oK75G/cagLF2JMP2E0x1x6qNQGOEUW/edqJPbb3eXflbtPImj6rr
 6mU9S7lgocbnzdZMe07a8786qBJXU0lxf05aRXoxRuFJMsGDl2iAXDkYuqhNkARf4s
 MxPTFY6X9AF2y/gnXEoGeobYHJvx5MR4EWTe2hp42in/8iWVNNdGaLMqCpALPbiZyj
 rFX4rJG1dpVLQ==
Message-ID: <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Date: Thu, 9 Jul 2026 08:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, Michal Simek <michal.simek@amd.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 bjorn.andersson@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
Cc: linux-samsung-soc@vger.kernel.org, aniket.randive@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 chandana.chiluveru@oss.qualcomm.com, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] tty: serial: propagate errors from
 uart_ops.pm callback
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linuxfoundation.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,kernel.org,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-samsung-soc@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.
 com,m:chandana.chiluveru@oss.qualcomm.com,m:linux-mediatek@lists.infradead.org,m:linux-serial@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[jirislaby@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jirislaby@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B81A72D606

T24gMDkuIDA3LiAyNiwgODoyNSwgUHJhdmVlbiBUYWxhcmkgd3JvdGU6Cj4gVGhlIHVhcnRfb3Bz
LnBtIGNhbGxiYWNrIGhhcyBiZWVuIGRlY2xhcmVkIHZvaWQgc2luY2UgaXRzIGludHJvZHVjdGlv
biwKPiB3aGljaCBtZWFucyBhbnkgZXJyb3IgZnJvbSBhIGRyaXZlcidzIHBvd2VyIG1hbmFnZW1l
bnQgaW1wbGVtZW50YXRpb24gaXMKPiBzaWxlbnRseSBkaXNjYXJkZWQgYnkgdWFydF9jaGFuZ2Vf
cG0oKS4gQmV5b25kIGxvc2luZyB0aGUgZXJyb3IKPiBpbmZvcm1hdGlvbiwgdWFydF9jaGFuZ2Vf
cG0oKSB1bmNvbmRpdGlvbmFsbHkgdXBkYXRlcyBzdGF0ZS0+cG1fc3RhdGUKPiBldmVuIHdoZW4g
dGhlIHVuZGVybHlpbmcgaGFyZHdhcmUgdHJhbnNpdGlvbiBmYWlsZWQuIFRoaXMgY2F1c2VzIHRo
ZQo+IHNlcmlhbCBjb3JlIHRvIHRyYWNrIGEgcG93ZXIgc3RhdGUgdGhhdCBkb2VzIG5vdCByZWZs
ZWN0IHJlYWxpdHk6Cj4gc3Vic2VxdWVudCBjYWxscyB0byB1YXJ0X2NoYW5nZV9wbSgpIHNlZSB0
aGUgc3RhbGUgY2FjaGVkIHN0YXRlIGFzCj4gbWF0Y2hpbmcgdGhlIHJlcXVlc3RlZCBzdGF0ZSBh
bmQgc2tpcCB0aGUgY2FsbGJhY2sgZW50aXJlbHksIGxlYXZpbmcgdGhlCj4gaGFyZHdhcmUgcGVy
bWFuZW50bHkgc3R1Y2sgd2l0aCBubyBmdXJ0aGVyIHJlY292ZXJ5IGF0dGVtcHQuCj4gCj4gT24g
bW9kZXJuIHBsYXRmb3JtcyB3aGVyZSB0aGUgLnBtIGNhbGxiYWNrIHBlcmZvcm1zIHJlYWwgd29y
ayDigJQKPiBlbmFibGluZyBjbG9jayB0cmVlcywgaW50ZXJhY3Rpbmcgd2l0aCBydW50aW1lIFBN
LCBhc3NlcnRpbmcgdm9sdGFnZQo+IHJlZ3VsYXRvcnMg4oCUIHRoaXMgaXMgYSBjb3JyZWN0bmVz
cyBnYXAuIEZhaWx1cmVzIGFyZSBpbnZpc2libGUgdG8gdGhlCj4gUE0gZnJhbWV3b3JrLCB0aGUg
cG9ydCBwcm9jZWVkcyB0byBjYWxsIG9wcy0+c3RhcnR1cCgpIG9uIHBvdGVudGlhbGx5Cj4gdW5w
b3dlcmVkIGhhcmR3YXJlLCBhbmQgc3VzcGVuZC9yZXN1bWUgZXJyb3JzIGFyZSBoaWRkZW4gZnJv
bSB0aGUgY29yZQo+IHRoYXQgbmVlZHMgdG8gaGFuZGxlIHRoZW0uCj4gCj4gVGhpcyBzZXJpZXMg
Zml4ZXMgdGhlIHByb2JsZW0gaW4gZm91ciBzdGVwczoKPiAKPiAgICBQYXRjaCAxIGNoYW5nZXMg
dGhlIHVhcnRfb3BzLnBtIGNhbGxiYWNrIHNpZ25hdHVyZSBmcm9tIHZvaWQgdG8gaW50LAo+ICAg
IHVwZGF0ZXMgdWFydF9jaGFuZ2VfcG0oKSB0byBwcm9wYWdhdGUgZXJyb3JzIGFuZCBvbmx5IGNv
bW1pdAo+ICAgIHN0YXRlLT5wbV9zdGF0ZSBvbiBzdWNjZXNzLCBhbmQgaGFuZGxlcyB0aGUgcmV0
dXJuIHZhbHVlIGF0IGV2ZXJ5Cj4gICAgY2FsbCBzaXRlIGluIHNlcmlhbF9jb3JlLmMgd2l0aCBh
cHByb3ByaWF0ZSBwb2xpY3kgcGVyIGNvbnRleHQKPiAgICAocHJvcGFnYXRlLCBsb2csIG9yIHNr
aXAtb24tZmFpbHVyZSkuCgpTbyBkb2VzIHRoaXMgYnJlYWsgYnVpbGQgd2l0aG91dCB0aGUgYmVs
b3cgYXBwbGllZD8gSU9XOiBicmVha3MgCmJpc2VjdGFiaWxpdHk/Cgo+ICAgIFBhdGNoIDIgdXBk
YXRlcyB0aGUgODI1MCBkcml2ZXIgZmFtaWx5OiBzZXJpYWw4MjUwX2RvX3BtKCkgYW5kCj4gICAg
c2VyaWFsODI1MF9wbSgpIGFyZSB1cGRhdGVkIHRvIHJldHVybiBpbnQgKHdpdGggdGhlIGV4cG9y
dGVkIHN5bWJvbAo+ICAgIGRlY2xhcmF0aW9uIHVwZGF0ZWQgaW4gc2VyaWFsXzgyNTAuaCksIGFu
ZCB0aGUgODI1MCBzdWItZHJpdmVyCj4gICAgcG0gY2FsbGJhY2tzIGFyZSB1cGRhdGVkIHRvIHJl
dHVybiAwLgo+IAo+ICAgIFBhdGNoIDMgdXBkYXRlcyB0aGUgcmVtYWluaW5nIG5vbi04MjUwIHNl
cmlhbCBkcml2ZXJzLiBBbGwgLnBtCj4gICAgaW1wbGVtZW50YXRpb25zIGFyZSB1cGRhdGVkIHRv
IHJldHVybiAwLiBUaGUgc2gtc2NpIGZvcndhcmQKPiAgICBkZWNsYXJhdGlvbiBzaGFyZWQgd2l0
aCByc2NpIGlzIGFsc28gdXBkYXRlZC4KPiAKPiAgICBQYXRjaCA0IHVwZGF0ZXMgYXJjaC1sZXZl
bCBpbXBsZW1lbnRhdGlvbnM6IFNBMTEwMCAoYXNzYWJldCwgaDN4eHgpLAo+ICAgIE9NQVAxL2Ft
cy1kZWx0YSAobW9kZW1fcG0sIG5vdyBwcm9wYWdhdGVzIHJlZ3VsYXRvciBlcnJvcnMpLCBhbmQK
PiAgICBNSVBTL0FsY2hlbXkgKGFsY2hlbXlfODI1MF9wbSkuCj4gCj4gQWxsIGV4aXN0aW5nIC5w
bSBpbXBsZW1lbnRhdGlvbnMgcmV0dXJuIDAsIHNvIHRoZXJlIGlzIG5vIGZ1bmN0aW9uYWwKPiBj
aGFuZ2UgZm9yIGFueSBjdXJyZW50IGRyaXZlci4gVGhlIHNlcmllcyBwdXJlbHkgYWRkcyB0aGUg
aW5mcmFzdHJ1Y3R1cmUKPiBmb3IgZHJpdmVycyB0byByZXBvcnQgZXJyb3JzIGdvaW5nIGZvcndh
cmQsIHdpdGggdGhlIHNlcmlhbCBjb3JlIHJlYWR5Cj4gdG8gaGFuZGxlIHRoZW0gY29ycmVjdGx5
LgoKT0ssIG5vdyBJIG1pc3MgdGhlIHJhdGlvbmFsZSBiZWhpbmQgdGhlIHBhdGNoc2V0LiBOZWl0
aGVyIHRoZXJlIGlzIGEgCnBvc3NpYmxlIGNvZGUgcGF0aCB0byBhY3R1YWxseSB0ZXN0IHRoaXM/
Cgp0aGFua3MsCi0tIApqcwpzdXNlIGxhYnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
