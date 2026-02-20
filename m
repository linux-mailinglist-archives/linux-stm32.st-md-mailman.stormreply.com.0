Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QffrKf1ImGk6FQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Feb 2026 12:43:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC0F167563
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Feb 2026 12:43:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9DC2C87ED5;
	Fri, 20 Feb 2026 11:43:56 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D531C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Feb 2026 11:43:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-43591b55727so1952706f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Feb 2026 03:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771587835; x=1772192635;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wBX6cnPwCpCSH4iNWjZA4c3kEfk5E/AuDIwwlVfhzyo=;
 b=NDpSV7h287F5sk9qyLXZ25qB9ZSdGA/vvIFWgmIacutp916TOUaiBgtety6DuRIttq
 Q0JRlL9y/XXBYOOdCOMQ6iYwdppq11bS7NZmSrcH4mldfJchI/GaHyTDicjy8UNv2fP4
 /9J+h8d0kJdH5EfJsseI8r6zJ6FaO38iAPRHuwlpjJedojDpCbD9YzY54FDOs57Gc9dM
 amBcfTN1K0sGTHQGwuu7pFTOUUscSbHheT03O6RIuCtwn1jPG3Zi4jWiX2Vq3ais/cRO
 l9KSLBRstgbD6Ln6dQiKPZWdy1PMWY3nlBSencEacR+6upZak4Qo44SUZ7CwqdzfHgrY
 /fGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771587835; x=1772192635;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wBX6cnPwCpCSH4iNWjZA4c3kEfk5E/AuDIwwlVfhzyo=;
 b=JdZf/ZO/Fwp182wzfxwx2na8gm8UAfQbHNyxMnoN8DFAOtBirlMYy3rqljXDUWwSO8
 d7rQVZmH6jn4Jwn+1mwrO8uWYLnvtZz7SrfgigVhwdVA2rykzXzfTtsZJzgZK/7lIygP
 2uG/Vv9/UU1ceJck+6K3wFnNl7HtZ6H0RevRhCANmlO4Mw2/PD4JvyXQReQZAjhGtVOi
 98JSUpiWsGjp5jEByyKNoWmfsp+c/PFvIYhiAv2UWp8Mcp/1DvFDsfJh6s7GfOFTESp0
 QuVzJqoi9zf7nasfoV1KPzfDcYWIZ6DH1my1RpPYH+IAoWmMDOu46qqsg3FPGz3T35J7
 bXTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH4mzp4a4ep7Z5BOz2A/UPH1CnnBYQVSXhNSKKQjtmcqG2TKZohx46+LlWwt8V6rUIHgQQn6QqzgrmGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1FFFYfVJl0tuRmG6YV/r9WB9QIPRgpUMTz+g3aKisbWW4nGYA
 +LWhecQsB89NL83fNR1lQTG87c5n2bjS46psP3iiWkL9oI2Nx253mOVa/mhEt8HwTSs=
X-Gm-Gg: AZuq6aLInU3Wwm8tn03zBrRGJ3WEnJF0AiZPgib1H005PZSvc2V/5SGnF7LUwXX9xQ5
 KUK1DBb8LxHoo8Cw0w3y5z5lKxtD0ZVt0hgqXozRa3QsQtJxdfO5OBUrddXJX0oUOOP/0xsZxxm
 ByR3OxPoSaFQxPNOFAp57DbdwtTeiMmQXqe7VSCA9sG8tPpo53ku+UWF+Epb90yN+euYXhae2Ql
 SVZwuDqtHtYqfbgYZ3en/TZusU7ylNNKgLEH58vrwj25YATEEtn+fUAWHQ9wVZChCxdWcdOG+iW
 uBCqepKyrgK1CJomAlmrxbGKwoLh1uVDQXM1cI23HfTSFvAwebIfynl+Up3fO0XTuaAPtm8ZqqP
 JTqBIpfPz6Jcw6ewcU3BaT6xIyMX/EoE0WW56QxOX4TOY3nU5Vi/hKuM4/WG30ezM0Paq9c5dsz
 XbqLLGyuAfRi13e1bu8kJIEY7tSQ/Db0msuCUbLk5zIIsCvVwKEcYtAgFJuB0t9g==
X-Received: by 2002:a5d:5f93:0:b0:435:e060:8071 with SMTP id
 ffacd0b85a97d-4379db61767mr35206496f8f.16.1771587835206; 
 Fri, 20 Feb 2026 03:43:55 -0800 (PST)
Received: from ?IPv6:2804:5078:822:3100:58f2:fc97:371f:2?
 ([2804:5078:822:3100:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5d156sm60289350f8f.5.2026.02.20.03.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 03:43:54 -0800 (PST)
Message-ID: <f074138f16e49e9966512cce2c07724ae9a77975.camel@suse.com>
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Richard Weinberger <richard@nod.at>, Anton Ivanov	
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson	 <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek	 <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness	 <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>,  Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>,  Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>
Date: Fri, 20 Feb 2026 08:43:42 -0300
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
User-Agent: Evolution 3.58.3 (by Flathub.org) 
MIME-Version: 1.0
Cc: kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/19] printk cleanup - part 3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[suse.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nod.at,cambridgegreys.com,sipsolutions.net,linuxfoundation.org,windriver.com,kernel.org,chromium.org,suse.com,goodmis.org,linutronix.de,debian.org,lunn.ch,davemloft.net,google.com,redhat.com,linux-m68k.org,intel.com,igalia.com,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,gaisler.com,linux.intel.com,foss.st.com,nuvoton.com,nxp.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[45];
	FORGED_RECIPIENTS(0.00)[m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:gregkh@linuxfoundation.org,m:jason.wessel@windriver.com,m:danielt@kernel.org,m:dianders@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:jirislaby@kernel.org,m:leitao@debian.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:geert@linux-m68k.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:andreas@gaisler.com,m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:laurentiu.tudor@nxp.com,m:kgdb-bugreport@lists.sourceforge.net,m:linux-um@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-harde
 ning@vger.kernel.org,m:linux-serial@vger.kernel.org,m:netdev@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mpdesouza@suse.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mpdesouza@suse.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:-];
	NEURAL_HAM(-0.00)[-0.567];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email]
X-Rspamd-Queue-Id: 3AC0F167563
X-Rspamd-Action: no action

T24gU2F0LCAyMDI1LTEyLTI3IGF0IDA5OjE2IC0wMzAwLCBNYXJjb3MgUGF1bG8gZGUgU291emEg
d3JvdGU6Cj4gVGhlIHBhcnRzIDEgYW5kIDIgY2FuIGJlIGZvdW5kIGhlcmUgWzFdIGFuZCBoZXJl
WzJdLgo+IAo+IFRoZSBjaGFuZ2VzIHByb3Bvc2VkIGluIHRoaXMgcGFydCAzIGFyZSBtb3N0bHkg
dG8gY2xhcmlmeSB0aGUgdXNhZ2UKPiBvZgo+IHRoZSBpbnRlcmZhY2VzIGZvciBOQkNPTiwgYW5k
IHVzZSB0aGUgcHJpbnRrIGhlbHBlcnMgbW9yZSBicm9hZGx5Lgo+IEJlc2lkZXMgaXQsIGl0IGFs
c28gaW50cm9kdWNlcyBhIG5ldyB3YXkgdG8gcmVnaXN0ZXIgY29uc29sZXMKPiBhbmQgZHJvcCB0
aGVzIHRoZSBDT05fRU5BQkxFRCBmbGFnLiBJdCBzZWVtcyB0b28gbXVjaCwgYnV0IGluIHJlYWxp
dHkKPiB0aGUgY2hhbmdlcyBhcmUgbm90IGNvbXBsZXgsIGFuZCBhcyB0aGUgdGl0bGUgc2F5cywg
aXQncyBiYXNpY2FsbHkgYQo+IGNsZWFudXAgd2l0aG91dCBjaGFuZ2luZyB0aGUgZnVuY3Rpb25h
bCBjaGFuZ2VzLgo+IAo+IFRoaXMgcGF0Y2hzZXQgaW5jbHVkZXMgYSBwYXRjaCBmcm9tIHBhcnQg
MiB0aGF0IG5lZWRlZCBtb3JlIHdvcmsgWzNdLAo+IGFzCj4gc3VnZ2VzdGVkIGJ5IFBldHIgTWxh
ZGVrLgo+IAo+IFRoZXNlIGNoYW5nZXMgd2VyZSB0ZXN0ZWQgYnkgcmV2ZXJ0aW5nIGY3OWIxNjNj
NDIzMQo+ICgiUmV2ZXJ0ICJzZXJpYWw6IDgyNTA6IFN3aXRjaCB0byBuYmNvbiBjb25zb2xlIiIp
LCBhbmQgdXNlZCBxZW11IHRvCj4gdGVzdAo+IHN1c3BlbmQvcmVzdW1lIGN5Y2xlcywgYW5kIGV2
ZXJ5dGhpbmcgd29ya2VkIGFzIGV4cGVjdGVkLgo+IAo+IFBTOiBiNCAtLWF1dG8tdG8tY2MgYWRk
ZWQgYSBidW5jaCBvZiBwZW9wbGUgYXMgQ0MsIHNvIEknbSBub3Qgc3VyZSBpZgo+IEkgc2hvdWxk
IHJlbW92ZSBzb21lIG9yIG5vdCwgc28gSSdtIGxlYXZpbmcgdGhlIGxpc3QgYXMgaXQgaXMuIElm
IHRoZQo+IHBhdGNoc2V0IG5lZWRzIGEgdjIsIGFuZCB5b3UgZmVlbCB0aGF0IHlvdSBkb24ndCBu
ZWVkIHRvIGNvcGllZCwganVzdAo+IGxldCBtZSBrbm93Lgo+IAo+IFRoYW5rcyBmb3IgY2hlY2tp
bmcgdGhlIHBhdGNoZXMsIGFuZCBoYXBweSBob2xpZGF5cyEKPiAKPiBbMV06Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDIyNi1wcmludGstcmVuYW1pbmctdjEtMC0wYjg3ODU3
N2YyZTZAc3VzZS5jb20vI3QKPiBbMl06Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
c2VyaWFsLzIwMjUxMTIxLXByaW50ay1jbGVhbnVwLXBhcnQyLXYyLTAtNTdiOGI3ODY0N2Y0QHN1
c2UuY29tLwo+IFszXToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1zZXJpYWwvYVNn
ZXFNM0RXdlI4LWNNWUBwYXRod2F5LnN1c2UuY3ovCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyY29z
IFBhdWxvIGRlIFNvdXphIDxtcGRlc291emFAc3VzZS5jb20+Cj4gLS0tCj4gTWFyY29zIFBhdWxv
IGRlIFNvdXphICgxOSk6Cj4gwqDCoMKgwqDCoCBwcmludGsvbmJjb246IFVzZSBhbiBlbnVtIHRv
IHNwZWNpZnkgdGhlIHJlcXVpcmVkIGNhbGxiYWNrIGluCj4gY29uc29sZV9pc191c2FibGUoKQo+
IMKgwqDCoMKgwqAgcHJpbnRrOiBJbnRyb2R1Y2UgY29uc29sZV9pc19uYmNvbgo+IMKgwqDCoMKg
wqAgcHJpbnRrOiBEcm9wIGZsYWdzIGFyZ3VtZW50IGZyb20gY29uc29sZV9pc191c2FibGUKPiDC
oMKgwqDCoMKgIHByaW50azogUmVpbnRyb2R1Y2UgY29uc29sZXNfc3VzcGVuZGVkIGdsb2JhbCBz
dGF0ZQo+IMKgwqDCoMKgwqAgcHJpbnRrOiBBZGQgbW9yZSBjb250ZXh0IHRvIHN1c3BlbmQvcmVz
dW1lIGZ1bmN0aW9ucwo+IMKgwqDCoMKgwqAgcHJpbnRrOiBJbnRyb2R1Y2UgcmVnaXN0ZXJfY29u
c29sZV9mb3JjZQo+IMKgwqDCoMKgwqAgZHJpdmVyczogbmV0Y29uc29sZTogTWlncmF0ZSB0byBy
ZWdpc3Rlcl9jb25zb2xlX2ZvcmNlIGhlbHBlcgo+IMKgwqDCoMKgwqAgZGVidWc6IGRlYnVnX2Nv
cmU6IE1pZ3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZSBoZWxwZXIKPiDCoMKgwqDCoMKg
IG02OGs6IGVtdTogbmZjb24uYzogTWlncmF0ZSB0byByZWdpc3Rlcl9jb25zb2xlX2ZvcmNlIGhl
bHBlcgo+IMKgwqDCoMKgwqAgZnM6IHBzdG9yZTogcGxhdGZvcm06IE1pZ3JhdGUgdG8gcmVnaXN0
ZXJfY29uc29sZV9mb3JjZSBoZWxwZXIKPiDCoMKgwqDCoMKgIHBvd2VycGM6IGtlcm5lbDogdWRi
ZzogTWlncmF0ZSB0byByZWdpc3Rlcl9jb25zb2xlX2ZvcmNlIGhlbHBlcgo+IMKgwqDCoMKgwqAg
c3BhcmM6IGtlcm5lbDogYnRleHQ6IE1pZ3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZSBo
ZWxwZXIKPiDCoMKgwqDCoMKgIHVtOiBkcml2ZXJzOiBtY29uc29sZV9rZXJuLmM6IE1pZ3JhdGUg
dG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZQo+IGhlbHBlcgo+IMKgwqDCoMKgwqAgZHJpdmVyczog
aHd0cmFjaW5nOiBzdG06IGNvbnNvbGUuYzogTWlncmF0ZSB0bwo+IHJlZ2lzdGVyX2NvbnNvbGVf
Zm9yY2UgaGVscGVyCj4gwqDCoMKgwqDCoCBkcml2ZXJzOiB0dHk6IHNlcmlhbDogbXV4LmM6IE1p
Z3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZQo+IGhlbHBlcgo+IMKgwqDCoMKgwqAgZHJp
dmVyczogdHR5OiBzZXJpYWw6IG1hMzVkMV9zZXJpYWw6IE1pZ3JhdGUgdG8KPiByZWdpc3Rlcl9j
b25zb2xlX2ZvcmNlIGhlbHBlcgo+IMKgwqDCoMKgwqAgZHJpdmVyczogdHR5OiBlaHZfYnl0ZWNo
YW46IE1pZ3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZQo+IGhlbHBlcgo+IMKgwqDCoMKg
wqAgZHJpdmVyczogYnJhaWxsZTogY29uc29sZTogRHJvcCBDT05fRU5BQkxFRCBjb25zb2xlIGZs
YWcKPiDCoMKgwqDCoMKgIHByaW50azogUmVtb3ZlIENPTl9FTkFCTEVEIGZsYWcKPiAKPiDCoGFy
Y2gvbTY4ay9lbXUvbmZjb24uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArLQo+IMKgYXJjaC9wb3dlcnBjL2tlcm5lbC91ZGJnLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNCArLQo+IMKg
YXJjaC9zcGFyYy9rZXJuZWwvYnRleHQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGFyY2gvdW0vZHJpdmVycy9tY29uc29sZV9rZXJu
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstCj4gwqBhcmNoL3Vt
L2tlcm5lbC9rbXNnX2R1bXAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAyICstCj4gwqBkcml2ZXJzL2FjY2Vzc2liaWxpdHkvYnJhaWxsZS9icmFpbGxl
X2NvbnNvbGUuYyB8wqDCoCAxIC0KPiDCoGRyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb25zb2xlLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4gwqBkcml2ZXJzL25l
dC9uZXRjb25zb2xlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxMyArLS0KPiDCoGRyaXZlcnMvdHR5L2Vodl9ieXRlY2hhbi5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGRyaXZlcnMvdHR5
L3NlcmlhbC9tYTM1ZDFfc2VyaWFsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0
ICstCj4gwqBkcml2ZXJzL3R0eS9zZXJpYWwvbXV4LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGRyaXZlcnMvdHR5L3R0eV9pby5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDYgKy0KPiDCoGZzL3Byb2MvY29uc29sZXMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSAtCj4gwqBmcy9wc3RvcmUv
cGxhdGZvcm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCA2ICstCj4gwqBpbmNsdWRlL2xpbnV4L2NvbnNvbGUuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0Mwo+ICsrKysrKysrKysr
KysrKysrKystLS0tLQo+IMKga2VybmVsL2RlYnVnL2RlYnVnX2NvcmUuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYgKy0KPiDCoGtlcm5lbC9kZWJ1
Zy9rZGIva2RiX2lvLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA2ICstCj4gwqBrZXJuZWwvcHJpbnRrL25iY29uLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNyArLS0KPiDCoGtlcm5lbC9w
cmludGsvcHJpbnRrLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDE0MCArKysrKysrKysrKystLQo+IC0tLS0tLS0tLQo+IMKgMTkgZmlsZXMgY2hh
bmdlZCwgMjMwIGluc2VydGlvbnMoKyksIDE0MyBkZWxldGlvbnMoLSkKClRoaXMgcGF0Y2hzZXQs
IHdpdGhvdXQgdGhlIHJlY2VudCBjbGVhbnVwIGZyb20gUGV0ciBNbGFkZWsgWzFdLCBoYXMgYQpy
ZWdyZXNzaW9uLiBJJ2xsIHdhaXQgZm9yIGl0IHRvIGJlIG1lcmdlZCBmaXJzdCBiZWZvcmUgc2Vu
ZGluZyBhIG5ldwp2ZXJzaW9uIG9mIHRoaXMgcGF0Y2hzZXQuIFRoYW5rcyBmb3IgYWxsIHRoZSBy
ZXZpZXdzIQoKWzFdOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjYwMjA2MTY1MDAy
LjQ5NjcyNC0xLXBtbGFkZWtAc3VzZS5jb20vCgo+IC0tLQo+IGJhc2UtY29tbWl0OiA5M2Q2NTU4
NzQ3OWNmYzk3YzBkN2U0MWI1ZThjNjM3OGNhNjgxNjMyCj4gY2hhbmdlLWlkOiAyMDI1MTIwMi1w
cmludGstY2xlYW51cC1wYXJ0My1lYTExNmIxMWIzYTYKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gLS3C
oCAKPiBNYXJjb3MgUGF1bG8gZGUgU291emEgPG1wZGVzb3V6YUBzdXNlLmNvbT4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
