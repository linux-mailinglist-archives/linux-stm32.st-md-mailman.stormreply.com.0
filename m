Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDFeDmZGcGnXXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 04:22:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C18C4505C4
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 04:22:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74D4FC36B3C;
	Wed, 21 Jan 2026 03:22:13 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 344E8C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 03:22:12 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-81f4c0e2b42so3167689b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 19:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768965730; x=1769570530;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=17+DNkkNcmMDigIJBL8XgDaqQaWKVbdBHFS6qgPE1RU=;
 b=Sj5kW9dzjONwwwbNbEXwzn70LlHCnVg+fZKNFI2KTXICPWZDHMqk34Nnayr68BoGtB
 Lx2gsAQRMLMTRO6MN6/fNj51k1dNiH7+pbE4iJGQdV1ZbrW9TRHU9/6asvCD723aa2US
 GGNk/fwGfEVX2gjuYMGnoFcDUofKHVSIavIccxRdYlNrbGHofIVMuV8EaIvmhkrer5kY
 gXXlBbzvQ8kLukQvM3Oeicok+2bLMXRdJ+AMbfM5MW0CrFAWXPaVnnRJoY4Lae3V/qnj
 9/jFu99xOYf1wgKclsH0TgPc3GTYkDQlZQG99UjXKXBhFiq4z11CLGmhgd6km4wke/DL
 uuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768965730; x=1769570530;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=17+DNkkNcmMDigIJBL8XgDaqQaWKVbdBHFS6qgPE1RU=;
 b=o8e769nyzZcuFQgdu/LJZpLG8pIhcYjIj8JwauFHx5rvTE0WPeNFM/Bxd+rzFIDT7k
 Bg2E8domC287eu2qTwVmZZnxSqeD6xuFcrv2h5IaKWJDrk+8vyr/CJbxxpgNnKyB68A0
 0Nvu+ACtDfOwAACJCfa9jpw34Q4r7yAZEjvcoEjsFsdMJED2Mh1Om+y+P88oW58Y1XLv
 ZE26uiQFM90I8MWLGWezJyZx4euWErhJ1d5jBDUjP2MaKUMpL0WmZyAyxMr67V3k/p7V
 ffABXM0g/l+3UCaGFA4Ky9zG7Ja0WhFtjQAxxrdDNwmHkg1oyo/UcplAEs2L1zE23EXl
 tArg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP2XvHDdniRR+VIAIZ6FeyMnZ5Q1RPSsGxsE73ex7Rqrn7gbwFazFYCAthSu3rPDz4yed5LFq71XWmlg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/JWnvbjp/LMnr5XFvgpbmOM3Xj9OO1Z754omV1xozfBHdgXur
 sPLUUul/pvSwf59vPcxFQqEHVksdKLP2nzpTWJh4GHVrmcSCIkW9WCna
X-Gm-Gg: AZuq6aK6ZHN9+FtNOHRimNmnAuaPpBE5K9Unhd1voAGG6kbD5iEnsoE4tcKT6d9c3WA
 fkV2nWDisxMrbqGSQqkig3FI6QcW3pBtuY/Ri1W8jja2p9YkQpNB9Q12J88hg0QdQL8ZU6DG/RU
 9DI4ue9LIJ/cN5Wp7LX28GXYyfFl0qdZWt5MlizC6Bd0P+AkEOsX4ryovE6kO66PTGKvNdXILZL
 35il3J2IaHAHOojQWdfDR00sW/7HBCWoVA9IcvbWrCLpBU0lkyomTMoAV2nDL8WPnUxK8JQOr7l
 xImm2RU5QW7Kh1ksmov1wdlKwUvPstlQlOfyi4oDkrRIvGHKhpKo6TzVVcYwAwtGoKQZTxNCH4X
 yfPw8jYSQZOZcwQxWT0NyQPXj2yZ+LYFekcSKeZ7Ipe1H0XPRxLo1VU5ZbHCEj/PmVzshs5LviY
 OGyJbdV9d2p2VYxOkBR2DTeOO4m0A5ZGY/ZZYO1SfnSM+xdNcfLJ7Md1aQq8+UOiov
X-Received: by 2002:aa7:888b:0:b0:81e:81fb:b392 with SMTP id
 d2e1a72fcca58-81fe87db4bamr3212275b3a.11.1768965730358; 
 Tue, 20 Jan 2026 19:22:10 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa1291135sm13268978b3a.47.2026.01.20.19.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 19:22:10 -0800 (PST)
Message-ID: <7a43bedf-6d31-4ae1-b2c6-97cb3757ad9f@gmail.com>
Date: Wed, 21 Jan 2026 11:22:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-2-a0987203069@gmail.com>
 <20260121020728.GA1671298-robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260121020728.GA1671298-robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org,
 netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, schung@nuvoton.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH net-next v8 1/3] dt-bindings: net:
 nuvoton: Add schema for Nuvoton MA35 family GMAC
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:openbmc@lists.ozlabs.org,m:netdev@vger.kernel.org,m:richardcochran@gmail.com,m:ychuang3@nuvoton.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:joabreu@synopsys.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:schung@nuvoton.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:yclu4@nuvoton.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,st-md-mailman.stormreply.com,lists.ozlabs.org,gmail.com,nuvoton.com,lunn.ch,google.com,synopsys.com,lists.infradead.org,st.com,redhat.com,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,2.100.46.192:email,0.0.0.0:email]
X-Rspamd-Queue-Id: C18C4505C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ClJvYiBIZXJyaW5nIOaWvCAxLzIxLzIwMjYgMTA6MDcgQU0g5a+r6YGTOgo+IE9uIE1vbiwgSmFu
IDE5LCAyMDI2IGF0IDAzOjMzOjM5UE0gKzA4MDAsIEpvZXkgTHUgd3JvdGU6Cj4+IENyZWF0ZSBp
bml0aWFsIHNjaGVtYSBmb3IgTnV2b3RvbiBNQTM1IGZhbWlseSBHaWdhYml0IE1BQy4KPj4KPj4g
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEpvZXkgTHUgPGEwOTg3MjAzMDY5QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICAgLi4u
L2JpbmRpbmdzL25ldC9udXZvdG9uLG1hMzVkMS1kd21hYy55YW1sICAgIHwgMTI2ICsrKysrKysr
KysrKysrKysrKwo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlh
bWwgICB8ICAgMSArCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMjcgaW5zZXJ0aW9ucygrKQo+PiAg
IGNyZWF0ZSBtb2RlIDEwMDc1NSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L251dm90b24sbWEzNWQxLWR3bWFjLnlhbWwKPiBUaGlzIHNob3VsZCBub3QgYmUgZXhlY3V0YWJs
ZS4KPgo+IFJvYgpUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuCgpJIHdpbGwgZml4IHRoZSBmaWxl
IG1vZGUgaW4gdGhlIG5leHQgcmV2aXNpb24uCgpKb2V5Cgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9udXZvdG9uLG1hMzVkMS1kd21hYy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9udXZvdG9uLG1hMzVkMS1k
d21hYy55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNzU1Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4u
OGVhZGRmZGM5MzdjCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9udXZvdG9uLG1hMzVkMS1kd21hYy55YW1sCj4+IEBAIC0wLDAg
KzEsMTI2IEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkKPj4gKyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL25ldC9udXZvdG9uLG1hMzVkMS1kd21hYy55YW1sIwo+PiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICsK
Pj4gK3RpdGxlOiBOdXZvdG9uIERXTUFDIGdsdWUgbGF5ZXIgY29udHJvbGxlcgo+PiArCj4+ICtt
YWludGFpbmVyczoKPj4gKyAgLSBKb2V5IEx1IDx5Y2x1NEBudXZvdG9uLmNvbT4KPj4gKwo+PiAr
ZGVzY3JpcHRpb246Cj4+ICsgIE51dm90b24gMTAvMTAwLzEwMDBNYnBzIEdpZ2FiaXQgRXRoZXJu
ZXQgTUFDIENvbnRyb2xsZXIgaXMgYmFzZWQgb24KPj4gKyAgU3lub3BzeXMgRGVzaWduV2FyZSBN
QUMgKHZlcnNpb24gMy43M2EpLgo+PiArCj4+ICthbGxPZjoKPj4gKyAgLSAkcmVmOiBzbnBzLGR3
bWFjLnlhbWwjCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAg
aXRlbXM6Cj4+ICsgICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgLSBudXZvdG9uLG1hMzVkMS1k
d21hYwo+PiArCj4+ICsgIHJlZzoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArICAgIGRlc2NyaXB0
aW9uOgo+PiArICAgICAgUmVnaXN0ZXIgcmFuZ2Ugc2hvdWxkIGJlIG9uZSBvZiB0aGUgR01BQyBp
bnRlcmZhY2UuCj4+ICsKPj4gKyAgaW50ZXJydXB0czoKPj4gKyAgICBtYXhJdGVtczogMQo+PiAr
Cj4+ICsgIGNsb2NrczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IE1B
QyBjbG9jawo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogUFRQIGNsb2NrCj4+ICsKPj4gKyAgY2xv
Y2stbmFtZXM6Cj4+ICsgICAgaXRlbXM6Cj4+ICsgICAgICAtIGNvbnN0OiBzdG1tYWNldGgKPj4g
KyAgICAgIC0gY29uc3Q6IHB0cF9yZWYKPj4gKwo+PiArICBudXZvdG9uLHN5czoKPj4gKyAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5Cj4+ICsg
ICAgaXRlbXM6Cj4+ICsgICAgICAtIGl0ZW1zOgo+PiArICAgICAgICAgIC0gZGVzY3JpcHRpb246
IHBoYW5kbGUgdG8gYWNjZXNzIHN5c2NvbiByZWdpc3RlcnMuCj4+ICsgICAgICAgICAgLSBkZXNj
cmlwdGlvbjogR01BQyBpbnRlcmZhY2UgSUQuCj4+ICsgICAgICAgICAgICBlbnVtOgo+PiArICAg
ICAgICAgICAgICAtIDAKPj4gKyAgICAgICAgICAgICAgLSAxCj4+ICsgICAgZGVzY3JpcHRpb246
Cj4+ICsgICAgICBBIHBoYW5kbGUgdG8gdGhlIHN5c2NvbiB3aXRoIG9uZSBhcmd1bWVudCB0aGF0
IGNvbmZpZ3VyZXMgc3lzdGVtIHJlZ2lzdGVycwo+PiArICAgICAgZm9yIE1BMzVEMSdzIHR3byBH
TUFDcy4gVGhlIGFyZ3VtZW50IHNwZWNpZmllcyB0aGUgR01BQyBpbnRlcmZhY2UgSUQuCj4+ICsK
Pj4gKyAgcmVzZXRzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgcmVzZXQtbmFtZXM6
Cj4+ICsgICAgaXRlbXM6Cj4+ICsgICAgICAtIGNvbnN0OiBzdG1tYWNldGgKPj4gKwo+PiArICBw
aHktbW9kZToKPj4gKyAgICBlbnVtOgo+PiArICAgICAgLSBybWlpCj4+ICsgICAgICAtIHJnbWlp
Cj4+ICsgICAgICAtIHJnbWlpLWlkCj4+ICsgICAgICAtIHJnbWlpLXR4aWQKPj4gKyAgICAgIC0g
cmdtaWktcnhpZAo+PiArCj4+ICsgIHR4LWludGVybmFsLWRlbGF5LXBzOgo+PiArICAgIGRlZmF1
bHQ6IDAKPj4gKyAgICBtaW5pbXVtOiAwCj4+ICsgICAgbWF4aW11bTogMjAwMAo+PiArICAgIGRl
c2NyaXB0aW9uOgo+PiArICAgICAgUkdNSUkgVFggcGF0aCBkZWxheSB1c2VkIG9ubHkgd2hlbiBQ
SFkgb3BlcmF0ZXMgaW4gUkdNSUkgbW9kZSB3aXRoCj4+ICsgICAgICBpbnRlcm5hbCBkZWxheSAo
cGh5LW1vZGUgaXMgJ3JnbWlpLWlkJyBvciAncmdtaWktdHhpZCcpIGluIHBpY28tc2Vjb25kcy4K
Pj4gKyAgICAgIEFsbG93ZWQgdmFsdWVzIGFyZSBmcm9tIDAgdG8gMjAwMC4KPj4gKwo+PiArICBy
eC1pbnRlcm5hbC1kZWxheS1wczoKPj4gKyAgICBkZWZhdWx0OiAwCj4+ICsgICAgbWluaW11bTog
MAo+PiArICAgIG1heGltdW06IDIwMDAKPj4gKyAgICBkZXNjcmlwdGlvbjoKPj4gKyAgICAgIFJH
TUlJIFJYIHBhdGggZGVsYXkgdXNlZCBvbmx5IHdoZW4gUEhZIG9wZXJhdGVzIGluIFJHTUlJIG1v
ZGUgd2l0aAo+PiArICAgICAgaW50ZXJuYWwgZGVsYXkgKHBoeS1tb2RlIGlzICdyZ21paS1pZCcg
b3IgJ3JnbWlpLXJ4aWQnKSBpbiBwaWNvLXNlY29uZHMuCj4+ICsgICAgICBBbGxvd2VkIHZhbHVl
cyBhcmUgZnJvbSAwIHRvIDIwMDAuCj4+ICsKPj4gK3JlcXVpcmVkOgo+PiArICAtIGNsb2Nrcwo+
PiArICAtIGNsb2NrLW5hbWVzCj4+ICsgIC0gbnV2b3RvbixzeXMKPj4gKyAgLSByZXNldHMKPj4g
KyAgLSByZXNldC1uYW1lcwo+PiArCj4+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+
ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9jbG9jay9udXZvdG9uLG1hMzVkMS1jbGsuaD4KPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvcmVzZXQvbnV2b3RvbixtYTM1ZDEtcmVzZXQuaD4KPj4gKyAgICBldGhlcm5ldEA0MDEy
MDAwMCB7Cj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibnV2b3RvbixtYTM1ZDEtZHdtYWMiOwo+
PiArICAgICAgICByZWcgPSA8MHg0MDEyMDAwMCAweDEwMDAwPjsKPj4gKyAgICAgICAgaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDIzIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+PiArICAgICAgICBpbnRl
cnJ1cHQtbmFtZXMgPSAibWFjaXJxIjsKPj4gKyAgICAgICAgY2xvY2tzID0gPCZjbGsgRU1BQzBf
R0FURT4sIDwmY2xrIEVQTExfRElWOD47Cj4+ICsgICAgICAgIGNsb2NrLW5hbWVzID0gInN0bW1h
Y2V0aCIsICJwdHBfcmVmIjsKPj4gKwo+PiArICAgICAgICBudXZvdG9uLHN5cyA9IDwmc3lzIDA+
Owo+PiArICAgICAgICByZXNldHMgPSA8JnN5cyBNQTM1RDFfUkVTRVRfR01BQzA+Owo+PiArICAg
ICAgICByZXNldC1uYW1lcyA9ICJzdG1tYWNldGgiOwo+PiArCj4+ICsgICAgICAgIHBoeS1tb2Rl
ID0gInJnbWlpLWlkIjsKPj4gKyAgICAgICAgcGh5LWhhbmRsZSA9IDwmZXRoX3BoeTA+Owo+PiAr
ICAgICAgICBtZGlvIHsKPj4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkd21hYy1t
ZGlvIjsKPj4gKyAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiArICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47Cj4+ICsKPj4gKyAgICAgICAgICAgIGV0aF9waHkwOiBldGhl
cm5ldC1waHlAMCB7Cj4+ICsgICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+PiArICAgICAgICAg
ICAgfTsKPj4gKyAgICAgICAgfTsKPj4gKyAgICB9Owo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+PiBpbmRleCBkZDNj
NzJlODM2M2UuLjEwY2I1ZTU1NTc1MCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPj4gQEAgLTY5LDYgKzY5
LDcgQEAgcHJvcGVydGllczoKPj4gICAgICAgICAgIC0gaW5nZW5pYyx4MjAwMC1tYWMKPj4gICAg
ICAgICAgIC0gbG9vbmdzb24sbHMyay1kd21hYwo+PiAgICAgICAgICAgLSBsb29uZ3Nvbixsczdh
LWR3bWFjCj4+ICsgICAgICAgIC0gbnV2b3RvbixtYTM1ZDEtZHdtYWMKPj4gICAgICAgICAgIC0g
bnhwLHMzMmcyLWR3bWFjCj4+ICAgICAgICAgICAtIHFjb20scWNzNDA0LWV0aHFvcwo+PiAgICAg
ICAgICAgLSBxY29tLHNhODc3NXAtZXRocW9zCj4+IC0tIAo+PiAyLjQzLjAKPj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
