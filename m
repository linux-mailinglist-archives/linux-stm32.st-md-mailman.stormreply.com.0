Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MVGTDU90VWpzogAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2026 01:27:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08474FB27
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2026 01:27:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=nabladev.com header.s=dkim header.b=fUzXAIaS;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nabladev.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99395CA8E50;
	Mon, 13 Jul 2026 23:27:10 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB254C7BF97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 23:27:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C4A21199D6; Tue, 14 Jul 2026 01:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1783985228;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=wkoq468eULIdSiAa93TheBL4sQoUuAbGk8pmYh3mGOs=;
 b=fUzXAIaSuCh0oLPMva5wnofUcYh/u51JZN3FvET/4kCQJLdmKG3HlfRe7x0gCpHXzOogRX
 15xvwUwAu3zbyLZto9isihoLwjwkb3NsO1R0qxFLsyYTYHBzioOy82PKkquo5O0nahn8ia
 /H6Rhz37FuMchcDLUMZKCm78dZuZp3a/6dFdrGjlXUpyrFNvpFAlp3Khnekk8F4HLRFJwf
 54kSvAOTIHjuSJJx+bMJwzLVMqsvgs/1Z2qXyJOEPOUoxHlDiTCD88rkTel5SrMQ9Yh9gu
 vWg1bBFNXt2UWeqGaaLN//bfhV/n6PxulHNZCRcl71tBhwPzVLoQYoXPvc+wgg==
Message-ID: <47178bf9-1fc7-4585-aa17-37ec07152b01@nabladev.com>
Date: Mon, 13 Jul 2026 12:33:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@kernel.org>
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-3-marex@nabladev.com>
 <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/10] dt-bindings: gpio: pca95xx:
 Document Kinetic KTS1622
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.99 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:kernel@dh-electronics.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[nabladev.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,dh-electronics.com:email,nabladev.com:from_mime,nabladev.com:email,nabladev.com:mid,st.com:email,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF08474FB27

On 7/13/26 10:36 AM, Bartosz Golaszewski wrote:
> On Sat, 11 Jul 2026 22:59:31 +0200, Marek Vasut <marex@nabladev.com> said:
>> The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
>> expander via the I2C bus for microcontrollers when additional I/Os
>> are needed while keeping interconnections to the minimum. Datasheet
>> comparison suggests that it is compatible with TCAL6416, add the
>> compatible string and TCAL6416 as a fallback compatible.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Bartosz Golaszewski <brgl@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Linus Walleij <linusw@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>>   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>> index 4f955f855e1ab..4631388a7d914 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>> @@ -22,6 +22,9 @@ properties:
>>         - items:
>>             - const: diodes,pi4ioe5v6534q
>>             - const: nxp,pcal6534
>> +      - items:
>> +          - const: kinetic,kts1622
>> +          - const: ti,tcal6416
>>         - items:
>>             - enum:
>>                 - exar,xra1202
>> --
>> 2.53.0
>>
>>
> 
> I applied this. I would have sent a b4 notification but got this instead:
> 
> $ b4 ty -all
> Auto-thankanating commits in gpio/for-next
> Found 9 of your commits since 1.week
> Calculating patch hashes, may take a moment...
>    Located: [PATCH 00/10] arm64: dts: st: Add support for DH
> electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and
> DHSBC
> ---
> Generating 1 thank-you letters
>    Writing: ./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks
> Traceback (most recent call last):
>    File "/usr/bin/b4", line 8, in <module>
>      sys.exit(cmd())
>               ~~~^^
>    File "/usr/lib/python3/dist-packages/b4/command.py", line 417, in cmd
>      cmdargs.func(cmdargs)
>      ~~~~~~~~~~~~^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/command.py", line 113, in cmd_ty
>      b4.ty.main(cmdargs)
>      ~~~~~~~~~~^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/ty.py", line 681, in main
>      auto_thankanator(cmdargs)
>      ~~~~~~~~~~~~~~~~^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/ty.py", line 386, in auto_thankanator
>      send_messages(applied, wantbranch, cmdargs)
>      ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/ty.py", line 452, in send_messages
>      with open(outfile, 'wb') as fh:
>           ~~~~^^^^^^^^^^^^^^^
> OSError: [Errno 36] File name too long:
> './marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks'
B4 bug ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
