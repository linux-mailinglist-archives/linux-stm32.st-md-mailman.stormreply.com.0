Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 353D6A85E3
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 17:04:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6B89C35E01;
	Wed,  4 Sep 2019 15:04:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE494C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 15:04:57 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x84F0vtA013269; Wed, 4 Sep 2019 17:04:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=dNUukUDNlrngzjB224KnsIWFvzpNxNKzPZCl7nlhcig=;
 b=WS+J8YkbiP28erHXV+1OKyFn6iMaW66L642WJAaVr/Lk1ISu1mSRRL5jIheUfIkYT4xu
 6GLuOcTaf7VIrTRRwgk88Q+OeASJLduRnKVHHi9UphfuC5cfv77QknSNSh1nW961BgGw
 ECsBlbtiZcAUn603wMrZle5bBInPS19KrUkHf7WBLS3unw0hapznWGXhU9BCpSJ/mEHM
 DOtjK1LJM02YFNo0eycYH/lge26LemN+dJjQuAfD+rvS+iAgfV7nFmq8KXmrZ3M6B7AE
 FVkqsDgvMsyKZ/vGzYVfN2Or+0mcvzQEhQw5fKuqUPD+Z2I3JiuoY8sjhjlgf3VMwg4r 9w== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uqec3243e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 04 Sep 2019 17:04:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9BCDF4E;
 Wed,  4 Sep 2019 15:04:32 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE9D52C2A0D;
 Wed,  4 Sep 2019 17:04:31 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019
 17:04:31 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by Webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019
 17:04:31 +0200
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20190813095951.26275-1-ludovic.Barre@st.com>
 <20190813095951.26275-2-ludovic.Barre@st.com>
 <CAPDyKFpOj8g+eY-vTxW4Sk+wVYTP1-4jDJB=nE=24eSubBvN-g@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <87d0ea00-0410-ba40-fec5-4dd7f0d7a0dc@st.com>
Date: Wed, 4 Sep 2019 17:04:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpOj8g+eY-vTxW4Sk+wVYTP1-4jDJB=nE=24eSubBvN-g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-04_04:2019-09-04,2019-09-04 signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V5 1/3] mmc: mmci: add hardware busy
	timeout feature
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

hi Ulf

On 8/26/19 1:39 PM, Ulf Hansson wrote:
> On Tue, 13 Aug 2019 at 12:00, Ludovic Barre <ludovic.Barre@st.com> wrote:
>>
>> From: Ludovic Barre <ludovic.barre@st.com>
>>
>> In some variants, the data timer starts and decrements
>> when the DPSM enters in Wait_R or Busy state
>> (while data transfer or MMC_RSP_BUSY), and generates a
>> data timeout error if the counter reach 0.
> 
> I don't quite follow here, sorry. Can you please try to elaborate on
> the use case(s) more exactly?
> 
> For example, what happens when a data transfer has just finished (for
> example when MCI_DATAEND has been received) and we are going to send a
> CMD12 to stop it? In this case the CMD12 has the MMC_RSP_BUSY flag
> set.
>

example with cmd25 (write multi block)
mmci_request
     - mmci_start_data
	set MMCIDATATIMER, MMCIDATALENGTH, MMCIMASK0
     - mmci_start_command:
	set MMCIARGUMENT, MMCICOMMAND (cmd25)

mmci_irq:
     - irq MCI_CMDRESPEND
     - irq MCI_DATAEND
     - send cmd12 => mmci_start_command(host->stop_abort or data->stop)
     these cmds have flag rsp_busy and no data associate
     host->cmd = cmd (host->stop_abort or data->stop) for next irq

mmci_irq:
     - irq MCI_CMDRESPEND
     - irq BUSYD0END
     - mmci_request_end

> Another example is the CMD5, which has no data with it.
> 
>>
>> -Define max_busy_timeout (in ms) according to clock.
>> -Set data timer register if the command has rsp_busy flag.
>>   If busy_timeout is not defined by framework, the busy
>>   length after Data Burst is defined as 1 second
>>   (refer: 4.6.2.2 Write of sd specification part1 v6-0).
> 
> One second is not sufficient for all operations, like ERASE for
> example. However, I understand that you want to pick some value, as a
> safety. I guess that's fine.
> 
> I am thinking that if the command has the MMC_RSP_BUSY flag set, the
> core should really provide a busy timeout for it. That said, maybe the
> host driver should splat a WARN in case there is not busy timeout
> specified.

Today, I just see a busy_timeout not defined on write request.
On erase request, the timeout is defined in function mmc_do_erase.
In core, there are several paths to done a write request, and I not
be sure to fix all. For safety, I preferred fix with the max value of
write request.

> 
>> -Add MCI_DATATIMEOUT error management in mmci_cmd_irq.
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>> ---
>>   drivers/mmc/host/mmci.c | 37 ++++++++++++++++++++++++++++++++-----
>>   drivers/mmc/host/mmci.h |  3 +++
>>   2 files changed, 35 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
>> index c37e70dbe250..c50586540765 100644
>> --- a/drivers/mmc/host/mmci.c
>> +++ b/drivers/mmc/host/mmci.c
>> @@ -1075,6 +1075,7 @@ static void
>>   mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>>   {
>>          void __iomem *base = host->base;
>> +       unsigned long long clks = 0;
>>
>>          dev_dbg(mmc_dev(host->mmc), "op %02x arg %08x flags %08x\n",
>>              cmd->opcode, cmd->arg, cmd->flags);
>> @@ -1097,6 +1098,19 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>>                  else
>>                          c |= host->variant->cmdreg_srsp;
>>          }
>> +
>> +       if (host->variant->busy_timeout && !host->mrq->data) {
> 
> Suppose this is a CMD12 command, having the MMC_RSP_BUSY flag set. The
> command would then be sent to stop the transmission and then
> host->mrq->data would also be set.

Sorry, it's a mistake introduce by v5.
I would keep the clear of datatimer when is not needed
(no data & no rsp busy, see below). But on cmd23 (set_block_count) with 
datactrl_first variant property the datatimer should be protected.

To simplify and fix the code, I will remove the clear of datatimer
when there is no data & no rsp busy.

- if (host->variant->busy_timeout && !host->mrq->data) {
+ if (host->variant->busy_timeout && !cmd->flags & MMC_RSP_BUSY) {
+         ....
+         writel_relaxed(clks, host->base + MMCIDATATIMER);
+ }

> 
> If I recall earlier what you stated about the new sdmmc variant, the
> CMD12 is needed to exit the DPSM. Hence don't you need to re-program a
> new value for the MMCIDATATIMER register for this scenario?
> 
>> +               if (cmd->flags & MMC_RSP_BUSY) {
>> +                       if (!cmd->busy_timeout)
>> +                               cmd->busy_timeout = 1000;
>> +
>> +                       clks = (unsigned long long)cmd->busy_timeout;
>> +                       clks *= host->cclk;
> 
> Any problems with putting the above on one line?

No, it was just to not exceed 80 characters.

> 
>> +                       do_div(clks, MSEC_PER_SEC);
>> +               }
>> +               writel_relaxed(clks, host->base + MMCIDATATIMER);
> 
> This is writing zero to MMCIDATATIMER in case the MMC_RSP_BUSY isn't
> set, is that on purpose?

It was to clear the datatimer when the command has
no data & no rsp_busy. This allowed to look if the datatimer
was used and not correctly set with the right value (with datatimeout).

Like said above, I will remove this and set datatimer only
on rsp_busy flag.

> 
>> +       }
>> +
>>          if (/*interrupt*/0)
>>                  c |= MCI_CPSM_INTERRUPT;
>>
>> @@ -1203,6 +1217,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>>   {
>>          void __iomem *base = host->base;
>>          bool sbc, busy_resp;
>> +       u32 err_msk;
>>
>>          if (!cmd)
>>                  return;
>> @@ -1215,8 +1230,12 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>>           * handling. Note that we tag on any latent IRQs postponed
>>           * due to waiting for busy status.
>>           */
>> -       if (!((status|host->busy_status) &
>> -             (MCI_CMDCRCFAIL|MCI_CMDTIMEOUT|MCI_CMDSENT|MCI_CMDRESPEND)))
>> +       err_msk = MCI_CMDCRCFAIL | MCI_CMDTIMEOUT;
> 
> You might as well move the initial assignment of err_msk to the its
> declaration above.
> 

OK, thx

>> +       if (host->variant->busy_timeout && busy_resp)
>> +               err_msk |= MCI_DATATIMEOUT;
>> +
>> +       if (!((status | host->busy_status) &
>> +             (err_msk | MCI_CMDSENT | MCI_CMDRESPEND)))
>>                  return;
>>
>>          /* Handle busy detection on DAT0 if the variant supports it. */
>> @@ -1235,8 +1254,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>>                   * while, to allow it to be set, but tests indicates that it
>>                   * isn't needed.
>>                   */
>> -               if (!host->busy_status &&
>> -                   !(status & (MCI_CMDCRCFAIL|MCI_CMDTIMEOUT)) &&
>> +               if (!host->busy_status && !(status & err_msk) &&
>>                      (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
>>
>>                          writel(readl(base + MMCIMASK0) |
>> @@ -1290,6 +1308,9 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>>                  cmd->error = -ETIMEDOUT;
>>          } else if (status & MCI_CMDCRCFAIL && cmd->flags & MMC_RSP_CRC) {
>>                  cmd->error = -EILSEQ;
>> +       } else if (host->variant->busy_timeout && busy_resp &&
>> +                  status & MCI_DATATIMEOUT) {
>> +               cmd->error = -ETIMEDOUT;
>>          } else {
>>                  cmd->resp[0] = readl(base + MMCIRESPONSE0);
>>                  cmd->resp[1] = readl(base + MMCIRESPONSE1);
>> @@ -1948,6 +1969,8 @@ static int mmci_probe(struct amba_device *dev,
>>           * Enable busy detection.
>>           */
>>          if (variant->busy_detect) {
>> +               u32 max_busy_timeout = 0;
>> +
>>                  mmci_ops.card_busy = mmci_card_busy;
>>                  /*
>>                   * Not all variants have a flag to enable busy detection
>> @@ -1957,7 +1980,11 @@ static int mmci_probe(struct amba_device *dev,
>>                          mmci_write_datactrlreg(host,
>>                                                 host->variant->busy_dpsm_flag);
>>                  mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
>> -               mmc->max_busy_timeout = 0;
>> +
>> +               if (variant->busy_timeout)
>> +                       max_busy_timeout = ~0UL / (mmc->f_max / MSEC_PER_SEC);
> 
> It looks like the max busy timeout is depending on the current picked
> clock rate, right?
> 
> In such case, perhaps it's better to update mmc->max_busy_timeout as
> part of the ->set_ios() callback, as it's from there the clock rate
> gets updated. Or what do you think?

yes, it's possible

> 
>> +
>> +               mmc->max_busy_timeout = max_busy_timeout;
>>          }
>>
>>          /* Prepare a CMD12 - needed to clear the DPSM on some variants. */
>> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
>> index 833236ecb31e..d8b7f6774e8f 100644
>> --- a/drivers/mmc/host/mmci.h
>> +++ b/drivers/mmc/host/mmci.h
>> @@ -287,6 +287,8 @@ struct mmci_host;
>>    * @signal_direction: input/out direction of bus signals can be indicated
>>    * @pwrreg_clkgate: MMCIPOWER register must be used to gate the clock
>>    * @busy_detect: true if the variant supports busy detection on DAT0.
>> + * @busy_timeout: true if the variant starts data timer when the DPSM
>> + *               enter in Wait_R or Busy state.
>>    * @busy_dpsm_flag: bitmask enabling busy detection in the DPSM
>>    * @busy_detect_flag: bitmask identifying the bit in the MMCISTATUS register
>>    *                   indicating that the card is busy
>> @@ -333,6 +335,7 @@ struct variant_data {
>>          u8                      signal_direction:1;
>>          u8                      pwrreg_clkgate:1;
>>          u8                      busy_detect:1;
>> +       u8                      busy_timeout:1;
>>          u32                     busy_dpsm_flag;
>>          u32                     busy_detect_flag;
>>          u32                     busy_detect_mask;
>> --
>> 2.17.1
>>
> 
> Kind regards
> Uffe
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
