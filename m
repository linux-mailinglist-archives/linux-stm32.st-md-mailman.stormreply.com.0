Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 146FE532052
	for <lists+linux-stm32@lfdr.de>; Tue, 24 May 2022 03:43:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2772C03FDB;
	Tue, 24 May 2022 01:43:47 +0000 (UTC)
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63C4BC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 May 2022 01:43:45 +0000 (UTC)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.89])
 by rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb628c384f931-e9775;
 Tue, 24 May 2022 09:43:43 +0800 (CST)
X-RM-TRANSID: 2eeb628c384f931-e9775
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.26.114] (unknown[10.42.68.12])
 by rmsmtp-syy-appsvrnew05-12026 (RichMail) with SMTP id 2efa628c384394f-9b02a; 
 Tue, 24 May 2022 09:43:42 +0800 (CST)
X-RM-TRANSID: 2efa628c384394f-9b02a
To: Mark Brown <broonie@kernel.org>,
 Olivier MOYSAN <olivier.moysan@foss.st.com>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
 <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
 <YovZAf4S0XphBsco@sirena.org.uk>
From: tangbin <tangbin@cmss.chinamobile.com>
Message-ID: <3fb8d7f8-4506-3b28-22cb-863bda1f21c8@cmss.chinamobile.com>
Date: Tue, 24 May 2022 09:44:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YovZAf4S0XphBsco@sirena.org.uk>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, mcoquelin.stm32@gmail.com,
 arnaud.pouliquen@foss.st.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: Use
 of_device_get_match_data() tosimplify code
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
Content-Type: multipart/mixed; boundary="===============1720789890986045954=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--===============1720789890986045954==
Content-Type: multipart/alternative;
 boundary="------------95FD8FEA066A031C0B6A88AA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------95FD8FEA066A031C0B6A88AA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mark & Olivier：

On 2022/5/24 2:57, Mark Brown wrote:
> On Mon, May 23, 2022 at 03:28:48PM +0200, Olivier MOYSAN wrote:
>
>> The current patch requires a change in the driver.
>> Either changing STM_SAI_x_ID enums, or replacing data by a struct.
>> For instance:
>> struct stm32_sai_comp_data {
>> 	unsigned int id;
>> }
>> struct stm32_sai_comp_data stm32_sai_comp_data_a = {
>> 	.id = STM_SAI_A_ID;
>> }
>> struct of_device_id stm32_sai_sub_ids[] = {
>> 	.data = &stm32_sai_comp_data_a},
>> }
> Either approach works for me (or a revert for that matter).

     Thanks for your advice, I was thoughtless.

     I think change the date of STM_SAI_x_ID maybe simple. But if we 
don't change the id,

what about add a "#define" like the line 47:

#define STM_SAI_IS_SUB(x) ((x)->id == STM_SAI_A_ID || (x)->id == 
STM_SAI_B_ID)

then in the judgement, wu use:

     sai->id = (uintptr_t)of_device_get_match_data(&pdev->dev);

     if (!STM_SAI_IS_SUB(sai))

             return -EINVAL;


if you think that's ok, I will send patch v2 for you .

Thanks

Tang Bin


--------------95FD8FEA066A031C0B6A88AA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Mark &amp; Olivier：<br>
    </p>
    <div class="moz-cite-prefix">On 2022/5/24 2:57, Mark Brown wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YovZAf4S0XphBsco@sirena.org.uk">
      <pre class="moz-quote-pre" wrap="">On Mon, May 23, 2022 at 03:28:48PM +0200, Olivier MOYSAN wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The current patch requires a change in the driver.
Either changing STM_SAI_x_ID enums, or replacing data by a struct.
For instance:
struct stm32_sai_comp_data {
	unsigned int id;
}
struct stm32_sai_comp_data stm32_sai_comp_data_a = {
	.id = STM_SAI_A_ID;
}
struct of_device_id stm32_sai_sub_ids[] = {
	.data = &amp;stm32_sai_comp_data_a},
}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Either approach works for me (or a revert for that matter).</pre>
    </blockquote>
    <p>    Thanks for your advice, I was thoughtless.</p>
    <p>    I think change the date of STM_SAI_x_ID maybe simple. But if
      we don't change the id,</p>
    <p>what about add a "#define" like the line 47:</p>
    <p>#define STM_SAI_IS_SUB(x) ((x)-&gt;id == STM_SAI_A_ID ||
      (x)-&gt;id == STM_SAI_B_ID)</p>
    <p>then in the judgement, wu use:</p>
    <p><span style="color: rgb(128, 128, 128); font-family: 微软雅黑;
        font-size: 14px; font-style: normal; font-variant: normal;
        font-weight: normal; letter-spacing: normal; line-height:
        normal; orphans: auto; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 1;
        word-spacing: 0px; -webkit-text-stroke-width: 0px; display:
        inline !important; float: none; background-color: rgb(255, 255,
        255);">    sai-&gt;id =
        (uintptr_t)of_device_get_match_data(&amp;pdev-&gt;dev);</span></p>
    <p><span style="color: rgb(128, 128, 128); font-family: 微软雅黑;
        font-size: 14px; font-style: normal; font-variant: normal;
        font-weight: normal; letter-spacing: normal; line-height:
        normal; orphans: auto; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 1;
        word-spacing: 0px; -webkit-text-stroke-width: 0px; display:
        inline !important; float: none; background-color: rgb(255, 255,
        255);">    if (!STM_SAI_IS_SUB(sai))</span></p>
    <p><span style="color: rgb(128, 128, 128); font-family: 微软雅黑;
        font-size: 14px; font-style: normal; font-variant: normal;
        font-weight: normal; letter-spacing: normal; line-height:
        normal; orphans: auto; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 1;
        word-spacing: 0px; -webkit-text-stroke-width: 0px; display:
        inline !important; float: none; background-color: rgb(255, 255,
        255);">            return -EINVAL;<br>
      </span></p>
    <p><br>
    </p>
    <p>if you think that's ok, I will send patch v2 for you .</p>
    <p>Thanks</p>
    <p>Tang Bin<br>
    </p>
    <blockquote type="cite" cite="mid:YovZAf4S0XphBsco@sirena.org.uk">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------95FD8FEA066A031C0B6A88AA--



--===============1720789890986045954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1720789890986045954==--


