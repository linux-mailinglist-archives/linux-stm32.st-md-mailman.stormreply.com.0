Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 088DC25560A
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 10:11:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C47C4C3FADC;
	Fri, 28 Aug 2020 08:11:20 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140119.outbound.protection.outlook.com [40.107.14.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38754C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 06:58:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIz7Fu+yZ3b5THFZsuUsfMDAsayXJa8BaU+11On0HFrTppBKncKviTdk+NLXrK1zpKbu75YM0aC5QINjpxwKNy3EtOG9tT/TufIJXrOkteY3pOw8hrYbivtsEB2Dtauij8o4BZusBOysECwRCRrILcYSgsjRdUPs6sn7ymVf+Iy10JO5qVyAejqt3tp4nMdHblSTV45lCtrrO16Gf1RRKYBY04xUxNoqhod9kPRzi5GSuGW0KJsojEAiUSiPY50+IcuLGjph0fsJujC1sN1GKHR9d3yr+bLzV8Vdgc4ZopqGVaeIuUuwktXwW0gjU5cdbUBrvjXHfHnR2hU5fk1DNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KRb96wl2T4hMJBzukUzjnRhfzg3OSt8Ap2LJZs9XCM=;
 b=gjIg3iYEdWUqIcsWMokxZsUW90iLI9igzqAPaK8AcPfVuSsr19ZoHZhl5Qa89gjWvivmDuhM4kJ+amqTiHMauO3SV+l2bfrejXHUXrjf/GTpmrEtipCT6qKAxbQ9cIP7Xj10YGe0pLTnFxX8/mTlvUaEIc4rtOtPLaw23Xa4wNLREgN/el7UUajv9/g5TLCJpjU0V8DYw5xXrQQq4+4U96miUNBqAupBI9JVhYLthVjA2wtCqJQQkTWLMb1IJrNrKRgWdwqGE4MA/3PAkC3EAn0R6ALnT5XoDpfrKhKXLVPh5vu+LLtm9EHT0e6vx2R60vddwRSYL6rfFJV50xayhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KRb96wl2T4hMJBzukUzjnRhfzg3OSt8Ap2LJZs9XCM=;
 b=nXXE/QfpFZgnR1PBJpvspzMOW7GnRbXk1/jkH2kNLmes+5O/WoWSHMHh06RtN1gTGmaV1Dhi6vQ4KzmF/Z3Ij0Gnt2jCljkk8+7w/xCO+p5SX56SYf7/DWCnvoN9fGmRf3LFepEoDMTEeVHqh7vAAftK2/ZBh/asiqiV0munGpE=
Authentication-Results: st-md-mailman.stormreply.com; dkim=none (message not
 signed) header.d=none;st-md-mailman.stormreply.com; dmarc=none action=none
 header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0202MB2920.eurprd02.prod.outlook.com (2603:10a6:4:ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Fri, 28 Aug
 2020 06:58:02 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47%7]) with mapi id 15.20.3326.021; Fri, 28 Aug 2020
 06:58:02 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
 <20200828062443.GA17343@pi3>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <3a5cb59b-454e-2c3f-9f31-43147e843c66@axentia.se>
Date: Fri, 28 Aug 2020 08:57:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200828062443.GA17343@pi3>
Content-Language: sv-SE
X-ClientProxiedBy: HE1PR07CA0010.eurprd07.prod.outlook.com
 (2603:10a6:7:67::20) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.226.217.78) by
 HE1PR07CA0010.eurprd07.prod.outlook.com (2603:10a6:7:67::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.5 via Frontend Transport; Fri, 28 Aug 2020 06:58:00 +0000
X-Originating-IP: [85.226.217.78]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74471e62-3316-4233-cb5e-08d84b1fb4f7
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2920:
X-Microsoft-Antispam-PRVS: <DB6PR0202MB292023E0F80CA1BD1FA311AABC520@DB6PR0202MB2920.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQRQ8du2p6sW+W6Q+QOIo01jR2+LFAIOZ1ql56tZwqr6doF7NjvdpwD8nBDGleQPPnBqFHUV/4hgOlAb90LjwbV/z6EKwtWfw0/9mrDcdfZNfqP0+46qmSaWKXx19Qjzz4MqHdIy3WAi99rCLD635F6pTgJskx27RNKn6YOOeRSmE9gs8KpP3zXfpskvG58p427vs9HXWsp2FO8kr3gonu4+ASf9bFLyjOSAzJfFvlgJ103bX5i9+YUHT2yrgHFb8xAG748aiXdQC3K2MKmwZ2x+VEYlTJENzaf2krIhJezhpId8DOy+T3lv88H1cv67uKBUJbmCfWehg4JOhovPdNnxteiF2GEhZ514E+p5lu/NO07Nahm4cTj4SoKBpOuG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(366004)(376002)(39830400003)(396003)(2616005)(956004)(7416002)(6666004)(8936002)(8676002)(16576012)(6486002)(316002)(54906003)(16526019)(31696002)(2906002)(36916002)(52116002)(4326008)(5660300002)(26005)(478600001)(53546011)(66556008)(6916009)(66476007)(31686004)(86362001)(66946007)(36756003)(83380400001)(186003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: IrhIL4PVGKeLslVTvd2cUyagVkMhvCb6mY/wxoU3N250LxKeAVcrWrinNJGP5nc+6O06vdfwrqW9Caw6jbbRo5S/hNldGtjkKGRRoFGpzdk6wWXaa3O6ZqFTdTRrZ3dJtXqXvRsnbryKRShaa2n4/56sPn+FZ4kK6Gcessu6goX32+zJGK6reneibqN5C6R8LzmUJJ19vprxLtOCfh2rH0FVVFtXnaxiTf0xH5CczBNfDo5f27TnQUUyaxI/VVpoc+oeXWxnfQ+CxSfN39lR2t4jfoO0flW543cLVG0q46I5jfEnv8ZmQIIEEd3y/EiwCBFEG1dtKASDUlvRToYW86VdqOO3lP90CkBwVxtf/8vXxo7BTM3YDr4N3gYYtJJli8x4q5xW485+LEGFg3dLrjaMjIqJ6XabovwZSGgyKgrA3Ak5NEMB0Ql/hgYlNg6p0oSv02wXFzyMeZPHW8nfRyJMjJYXCSJkNiO/0iAvVtxGi3TUwRojNGrFZ5GHaWYksptCHrkjLLLfa4mfxOwhlm/XxjTTCcm35NyC8Mo+NAbF1x9nEgd+fDEGbSfOPt7Gxn0VziefMIEIBAlkXLh/qBbkuZoi8UzgUcMDFy898+ORrCugPz4LXu3TRJOSDPM+YaFbfmcQw+uK+LkU8GyOGA==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 74471e62-3316-4233-cb5e-08d84b1fb4f7
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 06:58:02.8181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YMwqatNergbB9BWksiekUOs6Xga7AOB63bDMUg3mcyBd3zZxUmPcuB8Tu1xZsHx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2920
X-Mailman-Approved-At: Fri, 28 Aug 2020 08:11:17 +0000
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 09/18] iio: afe: iio-rescale: Simplify
 with dev_err_probe()
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



On 2020-08-28 08:24, Krzysztof Kozlowski wrote:
> On Thu, Aug 27, 2020 at 11:46:40PM +0200, Peter Rosin wrote:
>> On 2020-08-27 21:26, Krzysztof Kozlowski wrote:
>>> Common pattern of handling deferred probe can be simplified with
>>> dev_err_probe().  Less code and also it prints the error value.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>
>>> ---
>>>
>>> Changes since v1:
>>> 1. Wrap dev_err_probe() lines at 100 character
>>> ---
>>>  drivers/iio/afe/iio-rescale.c | 7 ++-----
>>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/iio/afe/iio-rescale.c b/drivers/iio/afe/iio-rescale.c
>>> index 69c0f277ada0..8cd9645c50e8 100644
>>> --- a/drivers/iio/afe/iio-rescale.c
>>> +++ b/drivers/iio/afe/iio-rescale.c
>>> @@ -276,11 +276,8 @@ static int rescale_probe(struct platform_device *pdev)
>>>  	int ret;
>>>  
>>>  	source = devm_iio_channel_get(dev, NULL);
>>> -	if (IS_ERR(source)) {
>>> -		if (PTR_ERR(source) != -EPROBE_DEFER)
>>> -			dev_err(dev, "failed to get source channel\n");
>>> -		return PTR_ERR(source);
>>> -	}
>>> +	if (IS_ERR(source))
>>> +		return dev_err_probe(dev, PTR_ERR(source), "failed to get source channel\n");
>>
>> Hi!
>>
>> Sorry to be a pain...but...
>>
>> I'm not a huge fan of adding *one* odd line breaking the 80 column
>> recommendation to any file. I like to be able to fit multiple
>> windows side by side in a meaningful way. Also, I don't like having
>> a shitload of emptiness on my screen, which is what happens when some
>> lines are longer and you want to see it all. I strongly believe that
>> the 80 column rule/recommendation is still as valid as it ever was.
>> It's just hard to read longish lines; there's a reason newspapers
>> columns are quite narrow...
>>
>> Same comment for the envelope-detector (3/18).
>>
>> You will probably never look at these files again, but *I* might have
>> to revisit them for one reason or another, and these long lines will
>> annoy me when that happens.
> 
> Initially I posted it with 80-characters wrap. Then I received a comment
> - better to stick to the new 100, as checkpatch accepts it.
> 
> Now you write, better to go back to 80.
> 
> Maybe then someone else will write to me, better to go to 100.
> 
> And another person will reply, no, coding style still mentions 80, so
> keep it at 80.
> 
> Sure guys, please first decide which one you prefer, then I will wrap it
> accordingly. :)
> 
> Otherwise I will just jump from one to another depending on one person's
> personal preference.
> 
> If there is no consensus among discussing people, I find this 100 line
> more readable, already got review, checkpatch accepts it so if subsystem
> maintainer likes it, I prefer to leave it like this.

I'm not impressed by that argument. For the files I have mentioned, it
does not matter very much to me if you and some random person think that
100 columns might *slightly* improve readability.

Quoting coding-style

  Statements longer than 80 columns should be broken into sensible chunks,
  unless exceeding 80 columns significantly increases readability and does
  not hide information.

Notice that word? *significantly*

Why do I even have to speak up about this? WTF?

For the patches that touch files that I originally wrote [1], my
preference should be clear by now.

Cheers,
Peter

[1]

drivers/iio/adc/envelope-detector.c
drivers/iio/afe/iio-rescale.c
drivers/iio/dac/dpot-dac.c
drivers/iio/multiplexer/iio-mux.c

>> You did wrap the lines for dpot-dac (12/18) - which is excellent - but
>> that makes me curious as to what the difference is?
> 
> Didn't fit into limit of 100.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
