Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A6676803
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Jan 2023 19:31:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA274C65043;
	Sat, 21 Jan 2023 18:31:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1471C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Jan 2023 18:31:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so7968505wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Jan 2023 10:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZwoDBvRhZ51HVwRruPaZJDCI07MDbJL4OZ/OSacJub4=;
 b=DXZKAycNcbv1iXdoy5RHgDDWZYz4w+4tSZhy7uzlZ9WRKzJP0NHHQJfd+DVK6/tnoH
 r0LTdWDEOFwGr8v5G0MY8ojjJ4DNAlLLqpbItFA0EFgwFJcEisGZ+af3rxoFmuCZIUy3
 nX8GimRZPlWnpgUn/oFN7WktFnkdjfLqP4bWRObvDi/5Mj3sochYa7CCTEIjGWrZykPY
 5eUcrPhUqIPQag//q7hEEA7V7NR/4nLP4zSA87Hd7j0GRbZxRbI7v8M8X64YSyad29En
 O0cAi0zkhFgAu3eqbW5Fsxiirur0CXaQB1EGjsZnxMPQqNtW1i0Qs6cPKlj3pP9GeBfr
 tVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZwoDBvRhZ51HVwRruPaZJDCI07MDbJL4OZ/OSacJub4=;
 b=j/RZf5uUQ1ohsaghOJPhVJeintPVYJZTYotuyQ0oE0mCQL7/A14LiAO9rCY4la+WoN
 b7SBTejJW320wR+AXy2WwT81hrH+RnShF97ofPt8frLaJXBXHOqJ4hBskbXgXzaFriEl
 G3Yi6vUPMBtrZCwMgYq2FvXnDlF4n3GbO8Ndv4X02kxAbchXTlM7+uJvnGzWZ5C3i7zN
 5v+xU+L/ithonDUF8TxSrOo0uVXnYLrCFWeKtfrgqZ3MwgxtbdFrkaCMaNDSkug021Nd
 qIyfboMzpn2cLmmbTnzP0iNjQVbbB2YAka7MaBLDKmjiu8Nnu4GvjJCFsSR9NiY/Qa86
 mYVg==
X-Gm-Message-State: AFqh2kpKUNdXGpNbdT1toaiL5QUWuRZB+hGVjg8jzah2Qe9Y01hj0aP3
 kHu66fXK5E4092TDxbTx9dcsTA==
X-Google-Smtp-Source: AMrXdXtzA0VhWJr5PaMDSwqlmcQOuGEVhWjqw2Lcr/7uvjQ2leyTYFBOPlCVPt9XkFdATbe08+PT5Q==
X-Received: by 2002:a05:600c:5386:b0:3da:f670:a199 with SMTP id
 hg6-20020a05600c538600b003daf670a199mr18285088wmb.36.1674325889305; 
 Sat, 21 Jan 2023 10:31:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003daf6e3bc2fsm16026540wmq.1.2023.01.21.10.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 10:31:28 -0800 (PST)
Message-ID: <45b9b378-6619-c47a-b5ea-6b6b7edca785@linaro.org>
Date: Sat, 21 Jan 2023 19:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: Jonathan Cameron <jic23@kernel.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
 <20230118184413.395820-3-krzysztof.kozlowski@linaro.org>
 <20230121171709.5eb75e94@jic23-huawei>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230121171709.5eb75e94@jic23-huawei>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Sankar Velliangiri <navin@linumiz.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Artur Rojek <contact@artur-rojek.eu>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>, linux-samsung-soc@vger.kernel.org,
 Stefan Popa <stefan.popa@analog.com>, Sean Nyekjaer <sean@geanix.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 kernel@pengutronix.de, Michael Hennerich <Michael.Hennerich@analog.com>,
 Alexandru Lazar <alazar@startmail.com>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Stephen Boyd <swboyd@chromium.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andreas Klinger <ak@it-klinger.de>,
 linux-fbdev@vger.kernel.org, Renato Lui Geh <renatogeh@gmail.com>,
 Phil Reid <preid@electromag.com.au>, Benson Leung <bleung@chromium.org>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Puranjay Mohan <puranjay12@gmail.com>, Philippe Reynes <tremyfr@yahoo.fr>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Eugene Zaikonnikov <ez@norophonic.com>, Stefan Agner <stefan@agner.ch>,
 Robert Yang <decatf@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Harald Geyer <harald@ccbib.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Kent Gustavsson <kent@minoris.se>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 3/5] dt-bindings: iio: correct node names
	in examples
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 21/01/2023 18:17, Jonathan Cameron wrote:
> On Wed, 18 Jan 2023 19:44:11 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> Do not use underscores and unneeded suffixes (e.g. i2c0) in node name in
>> examples.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
>> diff --git a/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml b/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml
>> index 6c5ad426a016..12f75ddc4a70 100644
>> --- a/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml
>> +++ b/Documentation/devicetree/bindings/iio/health/ti,afe4403.yaml
>> @@ -42,7 +42,7 @@ examples:
>>          #address-cells = <1>;
>>          #size-cells = <0>;
>>  
>> -        heart_mon@0 {
>> +        heart-rate@0 {
> 
> These are both heart-rate and pulse oximeters so measure more than just
> the rate (oxygen saturation in the blood). Reality is they actually
> measure light absorption over time, but you can calculate an estimate
> of both rate and oxygen saturation from that.
> 
> I don't really mind simplifying that to heart-rate, but wanted to
> call this out for possible discussion.

They could be heart-mon. The fix is mostly around the underscore. I
don't have any arguments for changing it to heart-rate, thus we can go
with whatever you prefer.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
